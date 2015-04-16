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

#module.exports = (robot) ->   
#  robot.hear /(.*)test/i, (msg) ->
#  robot.hear /testtest/i, (msg) ->
#   msg.send "testmaro!"
#    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
#    .get()
#    request (err, res, body) ->
#      json = JSON.parse body
#      if day == 3 then forecast = '‚í‚©‚ç‚ñ‚·' else forecast = json['forecasts'][day]['telop']
#      outLine = json['title'] + "\r\n" + json['description']['text']
#      msg.send outLine

cheerio = require 'cheerio-httpcli'

module.exports = (robot) ->

  robot.hear /test3/i, (msg) ->

    # send HTTP request
    baseUrl = 'http://transit.loco.yahoo.co.jp/traininfo/gc/13/'

    cheerio.fetch baseUrl, (err, $, res) ->
      if $('.elmTblLstLine.trouble').find('a').length == 0
        #msg.send "Ž–ŒÌ‚â’x‰„î•ñ‚Í‚ ‚è‚Ü‚¹‚ñ"
        msg.send "yyyyyyyyyyyy"
        return
      $('.elmTblLstLine.trouble a').each ->
        url = $(this).attr('href')
        cheerio.fetch url, (err, $, res) ->
          title = " #{$('h1').text()} #{$('.subText').text()}"
          result = ""
          $('.trouble').each ->
            trouble = $(this).text().trim()
            result += "- " + trouble + "\r\n"
          msg.send "#{title}\r\n#{result}"

