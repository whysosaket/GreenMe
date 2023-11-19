import dotenv from "dotenv";
dotenv.config();

import { Request, Response } from "express";
import isValidEmail from "../utils/isValidEmail";

import jwt from "jsonwebtoken";
import convertToTitleCase from "../utils/makeTitleCase";
import isValidName from "../utils/isValidName";
import User from "../models/User";
import bcrypt from "bcrypt";
import CustomRequest from "../types/CustomRequest";
import Story from "../models/Story";

const JWT_SECRET = process.env.JWT_SECRET as string;

const tempConst = async (req: CustomRequest, res: Response) => {
  let success = false;

  try {
    success = true;
    return res.json({ success, info: "User Followed Successfully!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

const sendStory = async (req: CustomRequest, res: Response) => {
  let success = false;
  const { id } = req.user;
  try {
    const user = await User.findById(id);
    if (!user) {
      return res.json({ success, error: "User not found!" });
    }

    const { image, caption } = req.body;

    if (!image) {
      return res.json({ success, error: "Image is required!" });
    }

    const story = await Story.create({
      image,
      caption,
      user: id,
    });
    user.stories.push(story.id);
    await user.save();

    success = true;
    return res.json({ success, info: "Story Sent!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

const forgetStory = async (req: CustomRequest, res: Response) => {
  let success = false;
  let {username, increment} = req.body;
  try {
    const user = await User.findOne({username});
    if (!user) {
      return res.json({ success, error: "User not found!" });
    }
    user.score += increment;
    await user.save();
    success = true;
    return res.json({ success, info: "Done!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

const viewStory = async (req: CustomRequest, res: Response) => {
  let success = false;
  const { id } = req.user;
  try {
    const user = await User.findById(id);
    if (!user) {
      return res.json({ success, error: "User not found!" });
    }

    const following = user.following;
    const storyIDs = await User.find({ _id: { $in: following } }).select(
      "stories"
    );

    const stories = await Story.find({ _id: { $in: storyIDs } })
      .sort({ createdAt: -1 })
      .limit(10);


    success = true;
    return res.json({ success, stories });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};



const likeStory = async (req: CustomRequest, res: Response) => {
  let success = false;
  const { id } = req.user;
  try {
    const user = await User.findById(id);
    if (!user) {
      return res.json({ success, error: "User not found!" });
    }

    const story = await Story.findById(id);
    if (!story) {
      return res.json({ success, error: "Story not found!" });
    }

    story.likedBy.push(id);
    await story.save();

    success = true;
    return res.json({ success, info: "Story Liked!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

export { sendStory, viewStory, likeStory, forgetStory };
