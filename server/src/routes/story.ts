import { Router, Response } from "express";

import { sendStory, viewStory, likeStory, forgetStory } from "../controller/storyController";
import fetchuser from "../middleware/fetchuser";

export default (router: Router) => {
    router.route("/api/story/send").post(fetchuser, (req: any, res: Response)=>sendStory(req, res));
    router.route("/api/story/like").post(fetchuser, (req: any, res: Response)=>likeStory(req, res));
    router.route("/api/story/").get(fetchuser, (req: any, res: Response)=>viewStory(req, res));
    router.route("/api/story/forget").post((req: any, res: Response)=>forgetStory(req, res));
}