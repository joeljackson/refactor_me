express = require('express')
routes = require('./routes')
user = require('./routes/user')
http = require('http')
path = require('path')

app = express()

app.set('port', process.env.PORT || 3000)
app.set('views', __dirname + '/views')
app.set('view engine', 'hjs')
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(express.cookieParser('I am a very very secret key and will remain so'))
app.use(express.session())
app.use(app.router)
app.use(require('node-sass').middleware
    src: "#{__dirname}/public"
    dest: "#{__dirname}/public"
    debug: true
)
app.use(express.static(path.join(__dirname, 'public')))

# development only
if ('development' == app.get('env'))
    app.use(express.errorHandler())


app.get('/', routes.index)
app.get('/users', user.list)

http.createServer(app).listen app.get('port'), () ->
    console.log("Express server listening on #{app.get('port')}")
