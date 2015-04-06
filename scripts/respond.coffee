# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

#module.exports = (robot) ->
#
#  robot.hear /maro$/i, (msg) ->
#    msg.send 'nanjya?'

#  robot.hear /麻呂/i, (msg) ->
#    msg.send "麻呂を呼んだかえ？"

#  robot.respond /twitter (.*)/i, (msg) ->
#    keyword = encodeURIComponent msg.match[1]
#    request = msg.http('http://search.twitter.com/search.json')
#                          .query(q: keyword)
#                          .get()
#    request (err, res, body) ->
#      json = JSON.parse body
#      msg.send json.results[0].text if json.results.length > 0

module.exports = (robot) ->

  robot.hear /あんぶっしゅ$/i, (msg) ->
    appendAmbush(robot.brain.data.ambushes, tsubasa.matano, msg.message.user, "オレオレ")
