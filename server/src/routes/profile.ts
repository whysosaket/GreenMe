import { Router, Response } from "express";

import { viewSelf, viewOther, getScore } from "../controller/profileController";
import fetchuser from "../middleware/fetchuser";

export default (router: Router) => {
    router.route("/api/profile").get(fetchuser, (req: any, res: Response)=>viewSelf(req, res));
    router.route("/api/profile").post(fetchuser, (req: any, res: Response)=>viewOther(req, res));
    router.route("/api/score").get((req: any, res: Response)=>getScore(req, res));
}