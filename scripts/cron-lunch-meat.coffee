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

apiKeyId = process.env.GNABI_API_KEY

module.exports = (robot) ->
  lunchMeatCronJob = new cronJob('0 0 12 * * 2', () =>
#  lunchMeatCronJob = new cronJob('0 * * * * 1-5', () =>

    envelope = room: "#01_井戸端会議"
    greeting = "【火曜のお公家は Love Meat】"
    robot.send envelope, greeting

    apiHost = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?'  
    queryParam = '&areacode_m=AREAM2178&category_s=RSFST05001&format=json&hit_per_page=100' 

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
#      robot.send envelope, json.rest[getNumber].image_url.shop_image1
#      robot.send envelope, json.rest[getNumber].image_url.shop_image2
  )
  lunchMeatCronJob.start()
