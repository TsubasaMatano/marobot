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
  robot.respond /wiki (.*)/i, (msg) ->
    targetWord = msg.match[2]

    targetUrl = "http://ja.wikipedia.org/w/api.php?action=query&format=json&titles=" +
      targetWord + "&prop=extracts&redirects=1&exchars=300&explaintext=1"

    robot.http(targetUrl)
#      .header('User-Agent', 'Hubot Wikipedia Script')
      .get() (err, res, body) ->
        msg.send "���������s�����ł������i��" if err

        parseBody = JSON.parse body
#        console.log parseBody

        contentFlg = 0
        for key, value of parseBody.query.pages
          if key == '-1'
            msg.send "�y�[�W��������Ȃ��ł������I�i�{"
          else
            contentFlg = 1
            msg.send parseBody.query.pages[key].extract

#        msg.send res.statusCode
        if contentFlg == 1
          msg.send "�ڂ����͈ȉ����Q�Ƃ��邪�ǂ��B"
          msg.send "https://ja.wikipedia.org/wiki/#{encodeURIComponent(targetWord)}"

