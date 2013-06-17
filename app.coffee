express = require 'express'
routes = require './routes'
user = require './routes/user'
http = require 'http'

app = express()

#Setup the application
require('./config/setup')(app)

# development only
if ('development' == app.get('env'))
    app.use(express.errorHandler())

app.get('/', routes.index)
app.get('/users', user.list)

http.createServer(app).listen app.get('port'), () ->
    console.log("Express server listening on #{app.get('port')}")
