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

apiKeyId = '0ca4462b9755b31b2370ea002a5c0bbc'
module.exports = (robot) ->
  robot.respond /gurume/i, (msg) ->
    apiHost = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?'  
    queryParam = '&format=json&hit_per_page=1' 

    request = msg.http("#{apiHost}keyid=#{apiKeyId}#{queryParam}").get()
    request (err, res, body) ->
      json = JSON.parse(body)
      msg.send json.rest.url
      msg.send json.rest.image_url.shop_image1
#      msg.send json.total_hit_count
