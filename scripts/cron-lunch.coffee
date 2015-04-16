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

  lunchCronJob = new cronJob('0 0 15 * * 1-5', () =>
    envelope = room: "#01_general"

    maroMsg = "【今日のお昼はこれで決まりじゃ！！】"
    robot.send envelope, maroMsg

    keyword = random ["ラーメン",
      "焼肉",
      "パスタ",
      "寿司",
      "定食",
      "ケーキ"] + " 恵比寿"

#    imageMe msg, keyword, (url) ->
    imageMe robot, keyword, (url) ->
#      msg.send url
      robot.send envelope, url
  )
  lunchCronJob.start()

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
#        image = msg.random images
        image = random images
        cb ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"

