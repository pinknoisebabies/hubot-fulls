# Description:
#   LGTM
#
# Commands:
#   hubot LGTM - LGTM
#   hubot lgtm register <URL> - register a new LGTM

BRAIN_KEY = 'lgtm'

module.exports = (robot) ->
  robot.hear /lgtm register (http.+)/i, (msg) ->
    image = msg.match[1]
    images = robot.brain.get(BRAIN_KEY) or []
    images.push image
    robot.brain.set(BRAIN_KEY, images)

    msg.send "LGTM Registered"

  robot.hear /lgtm(?:\s*)$/i, (msg) ->
    default_images = [
      'https://i.gyazo.com/a5461fbbc35cc4ecf02738fdfbe1cd06.gif'
    ]

    images = default_images.concat(robot.brain.get(BRAIN_KEY) || [])

    msg.send msg.random images
