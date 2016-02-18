# Description:
#   None
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect": "0.2.0"
#   "underscore": "1.3.3"
#   "underscore.string": "2.3.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot wiki me <query> - Searches for <query> on Wikipedia.
#
# Author:
#   h3h

HTMLParser = require "htmlparser"

module.exports = (robot) ->
  robot.respond /(wiki) (.*)/i, (msg) ->
    targetWord = msg.match[2]

    targetUrl = "https://ja.wikipedia.org/w/api.php?action=query&format=json&titles=" +
      targetWord + "&prop=extracts&exchars=300&explaintext=1"

    robot.http(targetUrl)
      .get() (err, res, body) ->
        msg.send "処理が失敗したでおじゃる（泣" if err

        parseBody = JSON.parse body

        contentFlg = 0
        for key, value of parseBody.query.pages
          if key == '-1'
            msg.send "ページが見つからないでおじゃる！（怒"
          else
            contentFlg = 1
            msg.send parseBody.query.pages[key].extract

        if contentFlg == 1
          msg.send "詳しくは以下を参照するが良い。"
          msg.send "https://ja.wikipedia.org/wiki/#{encodeURIComponent(targetWord)}"
