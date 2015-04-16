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
cheerio = require 'cheerio-httpcli'

module.exports = (robot) ->

  goHomeCronJob = new cronJob('0 0 18 * * 1-5', () =>
#  goHomeCronJob = new cronJob('2 * * * * *', () =>
    envelope = room: "#01_general"
    greeting = "【まもなく定時じゃ。麻呂の電車遅延情報を教えてやろう】" 
    robot.send envelope, greeting

    # send HTTP request
    baseUrl = 'http://transit.loco.yahoo.co.jp/traininfo/gc/13/'

    cheerio.fetch baseUrl, (err, $, res) ->
      if $('.elmTblLstLine.trouble').find('a').length == 0
        robot.send envelope, "事故や遅延情報はありません"
        return
      $('.elmTblLstLine.trouble a').each ->
        url = $(this).attr('href')
        cheerio.fetch url, (err, $, res) ->
          title = "◎ #{$('h1').text()} #{$('.subText').text()}"
          result = ""
          $('.trouble').each ->
            trouble = $(this).text().trim()
            result += "- " + trouble + "\r\n"
         # robot.send "#{title}\r\n#{result}"
          robot.send envelope, "#{title}\r\n#{result}"
    
  )
  goHomeCronJob.start()
