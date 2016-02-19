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
  ERR_MSG = 'docomo 雑談対話APIの呼出に失敗しました。'
  API_KEY = process.env.DOCOMO_API_KEY

  status = { place: '東京' }

  robot.respond /(.+)$/i, (msg) ->
    unless API_KEY?
      return

    #既存のコマンドは反応しないように対処
    cmds = []
    for help in robot.helpCommands()
      cmd = help.split(' ')[1]
      cmds.push(cmd) if cmds.indexOf(cmd) is -1

    cmd = msg.match[1].split(' ')[0]
    unless cmds.indexOf(cmd) is -1
      return
    status.nickname = msg.envelope.user.name
    status.utt = msg.match[1]
    now = new Date().getTime()
    if now - status.time > 3 * 60 * 1000
      status.context = ''
      status.mode = ''
    msg
      .http('https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue')
      .query(APIKEY: API_KEY)
      .header('Content-Type', 'application/json')
      .post(JSON.stringify(status)) (err, res, body) ->
        if err? or res.statusCode isnt 200
          return msg.reply("#{ERR_MSG}\n```\n#{err}\n```")
        msg.reply(JSON.parse(body).utt)
        status.time = now
        status.context = JSON.parse(body).context
        status.mode = JSON.parse(body).mode

