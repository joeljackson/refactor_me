express = require 'express'
routes = require './routes'
http = require 'http'
mongoose = require 'mongoose'

app = express()

mongoose.connect 'mongodb://localhost/refactor_me_development', {db:{safe:true}}, (err) ->
    if err?
        console.log "Connection Error: #{err}"
        process.exit(1)

#Setup the application
require('./config/setup')(app)

#Get the models
require('./models/user')

#Setup our routes
require('./config/routes')(app)

http.createServer(app).listen app.get('port'), () ->
    console.log("Express server listening on #{app.get('port')}")
