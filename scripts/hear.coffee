# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.hear /麻呂/i, (msg) ->
    msg.send msg.random [
      "なんじゃ？",
      "麻呂を呼んだかえ？",
      "騒がしいのぅ。何用じゃ？",
      "ん？",
      "麻呂を呼んだからには、それなりの要件であろうな？",
      "お公家の名を軽々しく呼ぶでない！"
      ]

  robot.hear /金原/i, (msg) ->
    msg.send msg.random [
      "金原殿。下郎がお呼びじゃぞ",
      "GLの名を軽々しく口にするでないわ！",
      "その前に麻呂が話を聞いてやろう。申してみよ。",
      "金原氏と話したいとな？まずは麻呂に蹴鞠で勝ってからにせよ。"
      ]

  robot.hear /浅井/i, (msg) ->
    msg.send msg.random [
      "浅井殿は今ぷよぷよの事で頭が一杯なのじゃ。後にせい",
      "多忙な浅井殿は仕事が絶賛ボンバーマン中じゃ。",
      "その人、さっきネズミーランドで見たよ。",
      "熊の釜山を知っておるか？麻呂はまだ見た事がないのじゃ"
      ]

  robot.hear /ダメ|失敗/i, (msg) ->
    msg.send "
　　　　　　　　 |;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ノ|\r\n
　　　　　　　　 |丶､ ;;; __;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;_,,: ィ\";;_|\r\n
　　　　　　　　 ﾄ､;;;;;;;;;;;;;;;｀ ` '' ー -- ‐ '' \";;;;;;;;;,:ィ;:;!\r\n
　　　　　　　　,';:｀`' ‐ｮ ､ ,_ ;;;;;;;;;;;;;;;;;;;;;;;;;;; , - '\"l;:;:;:;:l 　　謝るだけなら三流\r\n
　　　　　　　　l;:;:;:;:;:;:;ﾐ　　 ｀ ` '' ｰ -‐ '\"　　　 ,ﾘ;:;:;:l\r\n
　　　　　　　　l;:;:;:;:;:;:;:ゝ　　 く三)　　　(三ｼ　　｀ヾ;:t、\r\n
　　　　　　　fﾐ{;:;:;:;:f'´　 , -－-_,, _,ｨ ､_,,ｨ,.-－､　 };f }　　言われてから修正出来て二流\r\n
　　　　　　　l ﾄl;:;:;:;:l　　､,ィ或tｭ､ﾞ:ミ　{,'ィt或ｱﾁ　l:l,/\r\n
　　　　　　　ﾞi,tヾ:;:;:!　　｀ヽ 二ノ　　　ﾄ ` ‐''\"´　 l:l:f\r\n
　　　　　　　 ヽ`ｰ};:l　　　　　　 ,r'､ 　 ヽ 　 　　　ﾘ_）　　言われる前に自分から気付いてようやく一流じゃ\r\n
　　　　　　　　 ｀\"^l:l　　　　　 ,/ﾞｰ､　 ,r'ヽ　　　　l\r\n
　　　　　　　　　　　ﾞi　　　　,ノ　 　 `'\"　 丶.　　 ,'\r\n
　　　　　　　 　 　 　ﾞl､　　 ′ ,, ｨrｪェzｭ､,_ 〉 } /\r\n
　　　　　　　　　　　　',ヽ　　ヘヾ'zｪｪｪッ',ｼ'　//ヽ 　　　　\r\n
　　　　　　　　　　　　 }　丶、　` ｰ--‐ '\"'´,/ノ:.:.:ヽ 　　　　・・・・そなたらは一体、いつになったら\r\n
　　　　　　　　　　　　/l　　 丶、　　　 　 ,.ｲ:.:.:.:.:.:.:.:丶､、　 　　　　　　　\r\n
　　　　　　　　　 ,r'\"^l　!　　　　` ー‐;オ´:.:.:.:.:.:.:.:.:.,ノ　 ,}、 　　　　　　　一流になるのでおじゃるか？\r\n
　　　　　,. -ｧ＝く（:.:.:.l　 l　　　　　 ／/:.:.:.:.:.:., - '\"　 ,／　ヽ、\r\n
　 , - '\"´ ／　,／｀＞'t､_」＿＿_,ｨ'ﾞ,ィ,.: -‐ '\"　,. -‐ '\"　　　　＼\r\n
"

#  robot.hear /maro$/i, (msg) ->
#    msg.send 'nanjya?'
