# DB

global['mongoose'] = require '../node_modules/mongoose/index.js'
mongoose.connect 'mongodb://localhost/happycom'

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', (callback) ->


  require './%models%/pcmTest.js'

module.exports = db
