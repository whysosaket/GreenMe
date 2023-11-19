#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from flask import Flask, request, jsonify
import pandas as pd
import tensorflow_hub as hub
import torch
import numpy as np
embed = hub.load("https://tfhub.dev/google/universal-sentence-encoder/4")
templates = []
app = Flask(__name__)
cosi = torch.nn.CosineSimilarity(dim=0)
@app.route('/upload', methods=['POST'])
def upload():
    global templates
    try:
        data = request.json
        templates = []
        for message in data['message']:
            embedding = embed([message]).numpy()
            templates.append(torch.tensor(embedding))
        return "SUCCESS", 200
    except Exception as e:
        return jsonify({'error': str(e)})
    
@app.route('/predict',methods = ['POST'])
def pred():
    try:
        data = request.json
        message = data['message']
        message_embedding = torch.tensor(embed([message]).numpy())
        for template_embedding in templates:
            output = cosi(template_embedding, message_embedding)
            if output.mean() >= 0.29:
                return "TRUE",200

        return "FALSE", 200
    except Exception as e:
        return e
    
if __name__ == '__main__':
    app.run()


# In[2]:


type(templates[0])


# In[ ]:




