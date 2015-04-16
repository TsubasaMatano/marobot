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
#fs = require 'fs'
#request = require 'request'
#cheerio = require 'cheerio'

#module.exports = (robot) ->
#  robot.respond /(image|img)( me)? (.*)/i, (msg) ->
#  robot.hear /testtesttest/i, (msg) ->

module.exports = (robot) ->   
  robot.hear /(.*)�̓V�C������/i, (msg) ->
   switch msg.match[1]
      when '����'
        day = 0
      when '����'
        day = 1
      when '�����'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=270000')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = '�킩���' else forecast = json['forecasts'][day]['telop']
      msg.reply forecast
