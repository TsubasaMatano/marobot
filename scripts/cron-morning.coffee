# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

cronJob = require('cron').CronJob
random = require('hubot').Response::random

module.exports = (robot) ->

  morningCronJob = new cronJob('0 0 10 * * 1-5', () =>
    envelope = room: "#01_general"
    greeting = "【麻呂のお天気予報でおじゃる】" 
    robot.send envelope, greeting 

    request = robot.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      outLine = json['title'] + "\r\n" + json['description']['text']
      robot.send envelope, outLine
  )
  morningCronJob.start()

