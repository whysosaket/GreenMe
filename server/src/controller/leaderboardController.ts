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

const getGlobalLeaderboard = async (req: Request, res: Response) => {
    let success = false;
    try{
        let users = await User.find().sort({score: -1});
        const simplifiedUsers = users.map(({ name, score }) => ({ name, score }));
        console.log(simplifiedUsers);
        success = true;
        return res.json({ success, users: simplifiedUsers });
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
};

const getFriendsLeaderboard = async (req: CustomRequest, res: Response) => {
    let success = false;
    const { id } = req.user;
    try{
        const user = await User.findById(id);
        if(!user){
            return res.json({success, error: "User not found!"});
        }
        const users = await User.find({_id: {$in: user.following}}).sort({score: -1});
        success = true;
        return res.json({success, users});
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
};


export { getGlobalLeaderboard, getFriendsLeaderboard };
