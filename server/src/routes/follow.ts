import { Router, Response } from "express";

import { followUser, unfollowUser } from "../controller/followController";
import fetchuser from "../middleware/fetchuser";

export default (router: Router) => {
    router.route("/api/follow/follow").post(fetchuser, (req: any, res: Response)=>followUser(req, res));
    router.route("/api/follow/unfollow").post(fetchuser, (req: any, res: Response)=>unfollowUser(req, res));
}