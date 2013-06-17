mongoose = require 'mongoose'

User = new mongoose.Schema
  username: {type: String, unique: true, trim: true}
  password: String
  salt: String
  email: String

mongoose.model "User", User