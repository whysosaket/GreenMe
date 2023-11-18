import User from "../models/User";


const increaseScore = async (user: string, increment: number) => {
    try {
        const userObj = await User.findById(user);
        if (!userObj) {
            return;
        }
        userObj.score += increment;
        await userObj.save();
        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}

export default increaseScore;