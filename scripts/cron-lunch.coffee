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

  lunchCronJob = new cronJob('0 0 12 * * 1-5', () =>
#  lunchCronJob = new cronJob('2 * * * * *', () =>
    envelope = room: "#01_general"

    maroMsg = "【今日のお昼はこれで決まりじゃ！！】"
    robot.send envelope, maroMsg

    keyword = random ["ラーメン 恵比寿",
      "肉 恵比寿",
      "刺身 恵比寿",
      "ランチ 高級 恵比寿"]

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
      else
        cb = random ["http://blog-imgs-46.fc2.com/i/c/h/ichii445/jyo10.jpg",
          "http://climbing-search.info/image/a0006_002266_m.jpg",
          "http://gurutabi.gnavi.co.jp/upload_img/gourmet/z/4/jo/jojoenyakinikubento_p_1.jpg"]

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"

