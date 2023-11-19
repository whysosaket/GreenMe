import { Router } from "express";
import auth from "./auth";
import follow from "./follow";
import leaderboard from "./leaderboard";
import profile from "./profile";
import story from "./story";

const router = Router();

export default (): Router => {
  auth(router);
  follow(router);
  leaderboard(router);
  profile(router);
  story(router);
  return router;
};
