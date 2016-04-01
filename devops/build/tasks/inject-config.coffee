replace = require 'gulp-replace'

module.exports = (stream) ->
  for pattern, value of process.env
    regex = new RegExp "%#{pattern}%", "g"
    stream = stream
    .pipe replace regex, value

  stream
