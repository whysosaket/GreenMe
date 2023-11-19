import dotenv from "dotenv";
dotenv.config();

import { Request, Response } from "express";
import  isValidEmail  from "../utils/isValidEmail";

import jwt from "jsonwebtoken";
import convertToTitleCase from "../utils/makeTitleCase";
import isValidName from "../utils/isValidName";
import User from "../models/User";
import bcrypt from "bcrypt";

const JWT_SECRET = process.env.JWT_SECRET as string;

const createUser = async (req: Request, res: Response) => {
  let success = false;

  let {name, email, password, username} = req.body;

  try{

    if(!isValidName(name)){
      return res.json({success, error: "Name is not valid!"});
    }else{
      name = convertToTitleCase(name);
    }

    if (!isValidEmail(email)) {
      return res.json({success, error: "Email Address is not valid!"});
    } 

    let user = await User.findOne({email: email});
    if(user){
      return res.json({success, error: "Email Address is already taken!"});
    }

    user = await User.findOne({username: username});
    if(user){
      return res.json({success, error: "Username is already taken!"});
    }

    if(password.length < 6){
      return res.json({success, error: "Password must be at least 6 characters long!"});
    }

    const securedPassword = await bcrypt.hash(password.toString(), 10);

    const newUser = await User.create({
      name,
      email,
      username,
      password: securedPassword
    });
    const data={
      user:{
          id:newUser.id
      }
    }
  const authToken = jwt.sign(data, JWT_SECRET);

    success = true;
    console.log(authToken)
    return res.json({ success, info: "Account Created Successfully!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
    
  }
};

const loginUser = async (req: Request, res: Response) => {
  let success = false;
  let { login, password } = req.body;
  console.log(login, password);
  try {
    let emailCheck = await User.findOne({ email: login });
    let usernameCheck = await User.findOne({ username: login });
    if (!emailCheck && !usernameCheck) {
      return res.json({ success, error: "Invalid Credentials!" });
    }

    let user = emailCheck ? emailCheck : usernameCheck;

    if (!user) {
      return res.json({ success, error: "Invalid Credentials!" });
    }

    const passwordCheck = await bcrypt.compare(password.toString(), user.password);

    if (!passwordCheck) {
      return res.json({ success, error: "Invalid Credentials!" });
    }

    const token = jwt.sign({ id: user._id }, JWT_SECRET);

    success = true;
    return res.json({ success, token });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

export { createUser, loginUser };