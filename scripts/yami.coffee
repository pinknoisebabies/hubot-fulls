# Description:
#   YAMI
#
# Commands:
#   hubot YAMI - YAMI
#   hubot yami register <URL> - register a new YAMI

BRAIN_KEY = 'yami'

module.exports = (robot) ->
  robot.hear /yami register (http.+)/i, (msg) ->
    image = msg.match[1]
    images = robot.brain.get(BRAIN_KEY) or []
    images.push image
    robot.brain.set(BRAIN_KEY, images)

    msg.send "YAMI Registered"

  robot.hear /yami(?:\s*)$/i, (msg) ->
    default_images = [
      'https://i.ytimg.com/vi/GLQStDik7KI/hqdefault.jpg'
    ]

    images = default_images.concat(robot.brain.get(BRAIN_KEY) || [])

    msg.send msg.random images
