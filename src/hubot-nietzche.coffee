# Description:
#   A hubot plugin to produce a random Nietzche quote whenever you feel a rush of existentialism
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot nietzche me - Get a Nietzche quote
#   hubot nietzche me N - get N quotes (where N <= 10)

module.exports = (robot) ->

  robot.respond /nietzche me$/i, (msg) ->
    msg.http("http://nietzche-json.herokuapp.com/")
      .get() (err, res, body) ->
        msg.send "> #{JSON.parse(body)[0].quote}."

  robot.respond /nietzche me\s{1}(\d+)?$/i, (msg) ->
    count = msg.match[1] || 1
    msg.http("http://nietzche-json.herokuapp.com/" + count)
      .get() (err, res, body) ->
        msg.send "> #{quotes.quote}." for quotes in JSON.parse(body)
