import mongoose from 'mongoose';

const fundriaserSchema = new mongoose.Schema({
  target: {
    type: Number,
    required: true,
  },
  raised: {
    type: Number,
    default: 0,
  },
  title: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  description: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  date: {
    type: Date,
    default: Date.now,
  },
  company: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  rewards: {
    type: Array,
    default: [],
  },
});

export default mongoose.model("transaction", fundriaserSchema);
