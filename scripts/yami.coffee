# Description:
#   YAMI
#
# Commands:
#   hubot YAMI - YAMI
#   hubot yami register <URL> - register a new YAMI

BRAIN_KEY = 'yami'
cron = require('cron').CronJob
random = require('hubot').Response::random

module.exports = (robot) ->
  new cron '0 0 17 * * 5', () ->
    envelope = {room: "dsp_dev_php"}
    robot.send envelope, "<!here>: " + randomImage()
  , null, true

  robot.hear /yami register (http.+)/i, (msg) ->
    image = msg.match[1]
    images = robot.brain.get(BRAIN_KEY) or []
    images.push image
    robot.brain.set(BRAIN_KEY, images)

    msg.send "YAMI Registered"

  robot.hear /yami(?:\s*)$/i, (msg) ->
    msg.send randomImage()

  robot.hear /yami test/i, (msg) ->
    msg.send "<!here>: " + randomImage()

  randomImage = () ->
    default_images = [
      'https://i.ytimg.com/vi/GLQStDik7KI/hqdefault.jpg'
    ]
    images = default_images.concat(robot.brain.get(BRAIN_KEY) || [])
    return random images
