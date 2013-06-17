pages_controller = require '../controllers/pages_controller'

module.exports = (app) ->
    app.get '/', pages_controller.index