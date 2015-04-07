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

module.exports = (robot) ->

  morningCronJob = new cronJob('0 0 10 * * 1-5', () =>
    envelope = room: "#01_general"
    robot.send envelope, "
　　　　　　　　　　「;:丶、:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:|\r\n
　　　　　 　 　 　 ﾄ､;:;:;:丶､:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:|\r\n
　　　　　　　　　　{::ﾄ､:;:;:;:;:;:｀ '' ー―――;:;: '|\r\n
　　　　　　　　 　 l::l . 丶､:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:;:|\r\n
　　　　　　　 　 　',:i r- ､、` ' ―――一'' \" .|\r\n
　　　　　　　 　 　 || ヾ三) 　 　 　 ,ィ三ﾐｦ　 |　\r\n
　　　　　　　 　 　 lj　　　　　　　　 ﾞ' ― '′ .|\r\n
　　　　　　　　　　 | , --:.:、:..　　 .:.:.:.:..:.:...　　|　良い朝でおじゃる\r\n
　　　　　　　　　　 | fr‐t-､ヽ.　 .:.:. '\",二ニ､､|\r\n
　　　　　　　　　　 l 丶‐三' ﾉ　　 :ヾイ､弋::ノ|　\r\n
　　　　　　　　　　 ',　ﾞ'ｰ-‐' ｲ: 　 :..丶三-‐'\"|\r\n
　　　　　　　　　 　 ',　　　　/.:　　 .　 　　　　|\r\n
　　　　　　　　　　　 ',　　,ｨ/ :　　　.:'^ヽ、.. 　|\r\n
　　　　　　　　　　 　 ',.:/.:.,{、:　　 .:　,ノ 丶::. |\r\n
　　　　　　　　　　　　ヽ　.i:, ヽ､__, イ　 　 _｀ﾞ.|\r\n
　　　　　　　　　 　 　 ,.ゝ､ト=､ェｪｪェ=テアヽ|\r\n
　　　　　　　　　　　_r/ /:.｀i ヽヾェェシ／ 　 |\r\n
　　　　 _,,. -‐ '' \" ´l. { ｛:.:.:.:',　`.':==:'.\"　　　 |\r\n
一 '' \"´　　　　 　　 ',ヽ丶:.:.:ヽ、　⌒ 　 　　 ,|\r\n
　　　　　　　　 　 　 ヽ丶丶､:.:.ゝ､ ＿＿_,. ｲ |\r\n
　　　　　　　　　 　 　 ｀丶､ ｀`\"二ﾕ、_,.＿___|\r\n
"
  )
  morningCronJob.start()

  lunchCronJob = new cronJob('0 30 12 * * 1-5', () =>
    envelope = room: "#01_general"
    robot.send envelope, "
　　　　　　　　　　　 　/:::::;;-‐-､:::ヽ 　　　　　　　　　　　 _,,,,,,,_\r\n
　 　　　　　　　　　　　 l::::::l　　_,,､-‐\"iiiiiilllllllllllliiiiiiiｰ-､__ゞ:::::::::::｀ヽ,\r\n
　　　　　　　　　　　　　ヽ::｀／: : : : iiiiiilllll||llllliiiiii: : : : : : ヽｲ~`ヽ:::::::\r\n
.　　　 　　　　　　　　　　／;,..-‐､: : : : : l|l: : : : : : : : : : : : : ＼　ﾉ:::::}\r\n
　　　　　　　　　　 　　 /: /: : : : :｀.: : : : : : : : :/´: ｀ヽ : : : : : :ヽ:::ノ\r\n
.　　　　　　　　　　　　 !: : : :iflllli､: : : : : : : : : : : : : : : :ヽ: : : : : :.\r\n
　　　　　　　　　　　　 |: : : :llllｆ　l: : : : : : : : : : :.iflllli､: : : : : ＜iiii|\r\n
　　　　　　　　　　　　 |: : : :|llll　|: : : : : : : : : : .llllf　l: : : : : : : : :.|\r\n
　　　　 　　　　　　　　|: : : :.!lllll!: : : : : : : : : : : |llll　|: : : : : : : : :i\r\n
　　　　　　　　　　　　/: : : : :　　　 　 　　 : : : !lllll!: : : : : : : : :.i\r\n
　　　　　　　　　　 ￣ ',　　　　/.:　　　　　　　: : : : : : : :.＜iii/\r\n
　　　　　　　　　　／ ',　 　 ,ｨ/ :　　　.:'^ヽ、..　　: : : : :-─ｿ,ト､─　　　／￣￣￣￣￣￣￣￣￣\r\n
　　　　　　　　　　　 　 ',.:/.:.,{、:　　 .:　,ノ 丶:::..　 -､ : : :ヽ　 l、　　　　│みんな！お昼食べてね！\r\n
　　　　　　　　　　　　　ヽ　.i:, ヽ､__, イ　　　_｀ﾞヾ　 ﾉ 　 / ,＼　 l:ヽ　＜ し麻呂じろうとのお約束だよ！！\r\n
　　　　　　　　　　　　　　 ,.ゝ､ト=､ェｪｪェ=テアヽ }　　　,/　 l　 l:.:(丶、│\r\n
　　　　　　　　　　　　_r/ /:.｀i ヽヾェェシ／　　ﾞ'　　／ 　 ,'　,':.:.:｀ヾヽ　＼＿＿＿＿＿＿＿＿\r\n
　　　　　 _,,. -‐ '' \" ´l. { ｛:.:.:.:',　`.':==:'.\" 　 　 　 ／　　 /　/:.:.:.:.:.:.}　ト―--　,,＿\r\n
　一 '' \"´　　　　 　　 ',ヽ丶:.:.:ヽ、　⌒　　　　,r'\"　　　 /　/:.:.:.:.:.:.:ﾉ,ノ |　　　　　 ｀`丶、\r\n
　　　　　　　　　　　　 ヽ丶丶､:.:.ゝ､ ＿＿_,. ｲ　　　　 /　/:.:..:.:.:.,ｨｼ′ |\r\n
　　　　　　　　　　　　　 ｀丶､ ｀`\"二ﾕ、_,.,＿＿＿＿/__,/;: -‐ '\"　　／　\r\n
"
  )
  lunchCronJob.start()

  goHomeCronJob = new cronJob('0 0 18 * * 1-5', () =>
    envelope = room: "#01_general"
    robot.send envelope, "
　　　l:;_;:_:;:_:;:_::_:;:_:;:_:;:_:;:_::_:;::_;|\r\n
　　　l:;_;:_:;:_:;:_::_:;:_:;:_:;::;:_;:;:_:;:_;|\r\n
　　　|＿＿＿＿＿＿＿＿＿|\r\n
　　　/　　　 ｌ　/　　　 ＼＼ヽ|）\r\n
　　　| 　　　|　''''''''''　　 　''''''''|\r\n
　　　| 　　　| ( 　･ )　　　( ･ )l\r\n
　　　| 　 　 ｌ　 　　　　　 ｌ　　|　　　　\r\n
　　　| 　（ ~　 　　 　　　 _)　 |　　　　そろそろ定時ですね。\r\n
　　　 | 　 |　 　 　 ,―――.　ｌ 　　　　明日もう一度このチャンネルに来てください。\r\n
　　　　ｌ　.|ヽ　 　　ー――' / 　　　　　本当の「麻呂」をご馳走しますよ。\r\n
　　　　ヾ |　 ＼＿＿＿＿ノ 　　　\r\n
　 ＿＿／ヽ＼　　　　　　| ｌ＼＿\r\n
￣　　　　　λ ヽ　　　　 / .|\r\n
"
  )
  goHomeCronJob.start()

  testCronJob = new cronJob('0 32 15 * * 1-5', () =>
    envelope = room: "#09_bot_test"
    say = random ["ランダムcronてすとNo1", "ランダムcronてすとNo2", "ランダムcronてすとNo3"]
    robot.send envelope, say
  )
  testCronJob.start()
