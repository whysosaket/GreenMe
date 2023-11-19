import { Router, Response } from "express";

import { getGlobalLeaderboard, getFriendsLeaderboard } from "../controller/leaderboardController";
import fetchuser from "../middleware/fetchuser";

export default (router: Router) => {
    router.route("/api/leaderboard/global").get((req: any, res: Response)=>getGlobalLeaderboard(req, res));
    router.route("/api/leaderboard/friends").post(fetchuser, (req: any, res: Response)=>getFriendsLeaderboard(req, res));
}