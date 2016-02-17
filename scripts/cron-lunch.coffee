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

apiKeyId = '0ca4462b9755b31b2370ea002a5c0bbc'

module.exports = (robot) ->
  lunchCronJob = new cronJob('0 0 12 * * 1-5', () =>
#  lunchCronJob = new cronJob('0 47 21 * * 1-5', () =>

    envelope = room: "#01_general"
    greeting = "【お公家のランチはやっぱり麺じゃな！】"
    robot.send envelope, greeting

    apiHost = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?'  
    queryParam = '&areacode_m=AREAM2178&category_s=RSFST08008&format=json&hit_per_page=100' 
#    keyword = random ["RSFST08008",
#                      "RSFST05001",
#                      "RSFST03003",
#                      ""]

    request = robot.http("#{apiHost}keyid=#{apiKeyId}#{queryParam}").get()
    request (err, res, body) ->
      json = JSON.parse(body)
      recTotal = json.total_hit_count

      if recTotal >= 100
        recTotal = 100

      getNumber = Math.floor(Math.random() * recTotal - 1)

#      robot.send envelope, "#{recTotal}"
#      robot.send envelope, "#{getNumber}"
      robot.send envelope, json.rest[getNumber].url
      robot.send envelope, json.rest[getNumber].image_url.shop_image1
#      robot.send envelope, json.rest[getNumber].image_url.shop_image2
  )
  lunchCronJob.start()
