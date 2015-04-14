# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

#cronJob = require('cron').CronJob
#random = require('hubot').Response::random
fs = require 'fs'

module.exports = (robot) ->

  robot.hear /testtest/i, (msg) ->
    filePath = 'files/images/maro/maro_soredakega.jpg'
    msg.send filePath
#    data = fs.readFileSync filePath, 'utf8'
#    console.log data

#    robot.send check
#
#  testCronJob = new cronJob('0 20 16 * * 1-5', () =>
#    envelope = room: "#09_bot_test"
#    robot.send envelope, "テストクーロン"
#  )
#  testCronJob.start()

#  testBCronJob = new cronJob('2 * * * * *', () =>
#    envelope = room: "#09_bot_test"
#    say = '定時退社の時間になりました。' + random ['おれおれ', 'オレオレ', 'エレエレ']
#    robot.send envelope, say
#  )
#  testBCronJob.start()
