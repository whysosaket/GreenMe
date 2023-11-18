import dotenv from "dotenv";
dotenv.config();

import { Request, Response } from "express";
import  isValidEmail  from "../utils/isValidEmail";

import jwt from "jsonwebtoken";
import convertToTitleCase from "../utils/makeTitleCase";
import isValidName from "../utils/isValidName";
import User from "../models/User";
import bcrypt from "bcrypt";
import CustomRequest from "../types/CustomRequest";

const JWT_SECRET = process.env.JWT_SECRET as string;

const followUser = async (req: CustomRequest, res: Response) => {
  let success = false;
  const { id } = req.user;
  try{

    const user = await User.findById(id);
    if(!user){
      return res.json({success, error: "User not found!"});
    }

    const {followedUserId} = req.body;
    const followedUser = await User.findById(followedUserId);
    if(!followedUser){
      return res.json({success, error: "User not found!"});
    }

    if(user.following.includes(followedUserId)){
      return res.json({success, error: "User already followed!"});
    }

    user.following.push(followedUserId);
    followedUser.followers.push(id);

    await user.save();
    await followedUser.save();

    success = true;
    return res.json({ success, info: "User Followed Successfully!!" });
  } catch (error) {
    console.log(error);
    return res.json({ error: "Something Went Wrong!" });
  }
};

const unfollowUser = async (req: CustomRequest, res: Response) => {

    let success = false;
    const { id } = req.user;
    try{

        const user = await User.findById(id);
        if(!user){
            return res.json({success, error: "User not found!"});
        }

        const {followedUserId} = req.body;
        const followedUser = await User.findById(followedUserId);
        if(!followedUser){
            return res.json({success, error: "User not found!"});
        }

        if(!user.following.includes(followedUserId)){
            return res.json({success, error: "User not followed!"});
        }

        user.following = user.following.filter((id) => id !== followedUserId);
        followedUser.followers = followedUser.followers.filter((id) => id !== user.id);

        await user.save();
        await followedUser.save();

        success = true;
        return res.json({ success, info: "User Unfollowed Successfully!!" });
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
};

export { followUser, unfollowUser };