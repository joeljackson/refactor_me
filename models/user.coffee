mongoose = require 'mongoose'

User = new mongoose.Schema
  username: {type: String, unique: true, trim: true}
  email: String
  accessToken: String

mongoose.model "User", User