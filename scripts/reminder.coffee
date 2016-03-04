cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 11 * * 1-5', () ->
    envelope = {room: "dsp_dev_php"}
    robot.send envelope, "<!here>: おい、朝会やるぞ！"
  , null, true

  new cron '0 0 12 * * 2', () ->
    envelope = {room: "dsp_dev_php"}
    robot.send envelope, "<!here>: http://blog-imgs-65.fc2.com/k/a/b/kabushiki/20140805072107ee1.jpg"
  , null, true

  new cron '0 50 12 * * 2', () ->
    envelope = {room: "dsp_dev_php"}
    robot.send envelope, "<!channel>: http://blog-imgs-47.fc2.com/h/i/r/hirottagazouneta/105.jpg"
  , null, true
