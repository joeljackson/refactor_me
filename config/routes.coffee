pages_controller = require '../controllers/pages_controller'

module.exports = (app) ->
    console.log('setting routes')
    app.get '/', pages_controller.index