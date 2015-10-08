cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 11 * * 1-5', () ->
    envelope = {room: "dsp_dev_php"}
    robot.send envelope, "<!here>: おい、朝会やるぞ！"
  , null, true
