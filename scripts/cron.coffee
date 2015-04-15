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

#  morningCronJob = new cronJob('0 0 10 * * 1-5', () =>
  morningCronJob = new cronJob('0 22 20 * * 1-5', () =>
    envelope = room: "#01_general"
    greeting = "【気持ちの良い朝じゃのぅ。今日もコレを見て頑張るのじゃ】"
    + random ["http://pic.prepics-cdn.com/momo19990829/5039215.jpeg",
      "http://pic.prepics-cdn.com/oregano/7563077.jpeg",
      "http://pic.prepics-cdn.com/mms01260922/8974796.jpeg",
      "http://blogimg.goo.ne.jp/user_image/11/81/79fe37fb523ac0a2637e0cf71bd6f08f.jpg",
      "http://decojiro.net/data/2009/06/10/45/4a2f90a0d7722.jpg",
      "http://livedoor.blogimg.jp/bokete01/imgs/d/0/d0e44b9e.jpg"]
    robot.send envelope, greeting 
  )
  morningCronJob.start()

  lunchCronJob = new cronJob('0 30 12 * * 1-5', () =>
    envelope = room: "#01_general"
    greeting = "【お昼の時間です。】"
    robot.send envelope, greeting
  )
  lunchCronJob.start()

  goHomeCronJob = new cronJob('0 0 18 * * 1-5', () =>
    envelope = room: "#01_general"
    greeting = "【まもなく定時になります。】" + random ["\r\n
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
","\r\n
|:;:;:;:;:;:;:;:;:;:;:;:;:;:i;:;:;:;:;:;:;:;:;:;:;:;:;\r\n
|;:;:_:;:_:;:_:;:_;:;_:;:l:;_;:_:;:_:;:_:;:_;:_;\r\n
|＿＿＿＿＿_|＿＿＿＿＿\r\n
／ 　\" ,,　\"　 \"　　ﾞ　 ﾞ　 /\r\n
,イ \"　\"　　\"　 八 ﾞ　ｉ ﾞ　| 　 ： 定\r\n
/　,ｨ´ \"/' ｲ　/::: ヽ　ﾄ、ﾞ|　　： 時\r\n
／/ ｨ' /| /| /:::　, -ヾ､ヽ,| 　 ： だ\r\n
　l　 l /-ﾚ､ﾚ'　 ´_,　a=＝|　！　 \r\n
　! /l,ﾊ＝a=､ 　ヾ`ー　 ´|　　 　 \r\n
　'\"　　',`ー/ :::　　　　　　|　　 　\r\n
　　　　 ',　/ ;:::: ､　　　 　　ヽ＿　　＿__\r\n
　　　 　 ∨_,　- '　　_,　　::::/;;;;::ﾉノ ヾ\r\n
　　　　　 丶 ｰ '' \"´　　 .:::/;;;;;::´　　 `\r\n
　　ｒ―､,／丶　 =＝　 .:::/;;;;;::::::\r\n
`<´ヽ r‐ヾ-､ ＼ 　　:::／;;;;::::::　　　　/\r\n
.(´ヽ　ゝー)ｒ┤/＼:／::;;;;::::::　　　　/\r\n
"]
    robot.send envelope, greeting
  )
  goHomeCronJob.start()
