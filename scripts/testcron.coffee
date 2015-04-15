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

module.exports = (robot) ->
#  robot.helper =
#    url: () ->
#      server = robot.server.address()
#      process.env.HEROKU_URL ? "https://marobot.herokuapp.com/"
#      process.env.HEROKU_URL ? "http://#{server.address}:#{server.port}"

  robot.hear /testtesttest/i, (msg) ->
#    imageMe msg, msg.match[3], (url) ->
    imageMe msg, "ラーメン", (url) ->
      msg.send url

imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = msg.random images
#	cb ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
#    msg.send "@maro_bot: img ラーメン"
#    url = 'http://cdn.memegenerator.net/instances/400x/37661228.jpg'
#    request filePath, (err, response, body) ->
#      $ = cheerio.load body


#    testUrl = 'http://impression-seikotsu.com/blog/wp-content/uploads/2015/01/%E5%A4%A7%E5%AF%92.jpg'
#    msg.send testUrl

#    filePath = 'files/images/maro/maro_soredakega.jpg'
#    encodeUrl = encodeURIComponent(filePath)
#    msg.send "#{robot.helper.url()}/#{filePath}"
#    msg.send filePath

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
