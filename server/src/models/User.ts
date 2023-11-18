import mongoose from 'mongoose';

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  email: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  password: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  username: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  score: {
    type: Number,
    default: 1000,
  },
  awards: {
    type: Array,
    default: [],
  },
  friends: {
    type: Array,
    default: [],
  },
  friendRequests: {
    type: Array,
    default: [],
  },
  friendRequestsSent: {
    type: Array,
    default: [],
  },
  followers: {
    type: Array,
    default: [],
  },
  anonymousID: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
});

export default mongoose.model("user", userSchema);
