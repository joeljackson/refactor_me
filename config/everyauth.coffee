mongoose = require "mongoose"

module.exports = (everyauth) ->
    everyauth.github
        .appId("73c6f9b1cadd6615444b")
        .appSecret("0d104b36a0c854204dd51ff3f49e458e5c902e15")
        .entryPath("/auth/github")
        .callbackPath("/auth/github/callback")
        .scope('user:email,gist')
        .findOrCreateUser( (session, accessToken, accessTokenExtra, githubUserData) ->
            User = mongoose.model "User"
            session.user_id = githubUserData.login
            user = User.where("username").equals(githubUserData.login)
            user = new User({username: githubUserData.login, email: githubUserData.email, accessToken: accessToken} ).save() unless user
            user
        ).redirectPath('/');
