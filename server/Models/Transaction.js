const mongoose = require("mongoose");

const transactionSchema = new mongoose.Schema({
  from: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
  },
  to: {
    type: String,
    required: true,
    min: 6,
    max: 255,
  },
  amount: {
    type: Number,
    default: 0,
  },
  date: {
    type: Date,
    default: Date.now,
  },
  isAnonymous: {
    type: Boolean,
    default: false,
  },
  anonymousID: {
    type: String,
    default: "",
  },
});

module.exports = mongoose.model("transaction", transactionSchema);
