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
  avatar: {
    type: String,
    default: "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg",
  },
  score: {
    type: Number,
    default: 1000,
  },
  awards: {
    type: Array,
    default: [],
  },
  followers: {
    type: Array,
    default: [],
  },
  following: {
    type: Array,
    default: [],
  },
  stories: {
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
