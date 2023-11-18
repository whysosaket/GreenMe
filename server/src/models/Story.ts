import mongoose from "mongoose";

const storySchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
  },
  image: {
    type: String,
    required: true,
  },
  caption: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now,
  },
  likedBy: {
    type: Array,
    default: [],
  },
});

export default mongoose.model("story", storySchema);
