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

const viewSelf = async (req: CustomRequest, res: Response) => {
    let success = false;
    try{
        const { id } = req.user;
        const user = await User.findById(id);
        if(!user){
            return res.json({success, error: "User not found!"});
        }
        success = true;
        return res.json({success, user});
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
};

const viewOther = async (req: Request, res: Response) => {
    let success = false;
    try{
        const { userId } = req.body;
        const user = await User.findById(userId);
        if(!user){
            return res.json({success, error: "User not found!"});
        }
        success = true;
        return res.json({success, user});
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
}

const getScore = async (req: CustomRequest, res: Response) => {
    const id = "6559aaa33c3621df5379d7b7";
    let success = false;
    try{
        const user = await User.findById(id);
        if(!user){
            return res.json({success, error: "User not found!"});
        }
        success = true;
        return res.json({success, score: user.score});
    } catch (error) {
        console.log(error);
        return res.json({ error: "Something Went Wrong!" });
    }
}

export { viewSelf, viewOther, getScore };
