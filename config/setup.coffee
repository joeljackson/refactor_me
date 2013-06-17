path = require 'path'
express = require 'express'

module.exports = (app) ->
    app.set 'port', process.env.PORT || 3000
    app.set 'views', __dirname + '/../views'
    app.set 'view engine', 'hjs'
    app.use express.favicon()
    app.use express.logger('dev')
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser('I am a very very secret key and will remain so')
    app.use express.session()
    app.use app.router
    app.use require('stylus').middleware("#{__dirname}/public")
    app.use express.static(path.join(__dirname, 'public'))
    # development only
    if ('development' == app.get('env'))
        app.use(express.errorHandler())
