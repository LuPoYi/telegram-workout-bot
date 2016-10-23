require 'telegram/bot'

module Bot
  TOKEN = YAML.load(File.open("#{__dir__}/../config/settings.yml"))[:token]
  puts "TOKEN #{TOKEN}"
  def self.start!
    ans = Workout.create(:aerobic => 1, :date => Date.today)
    puts "ans #{ans.aerobic}"
    bbb = Body.create(:weight => 80, :date => Date.today)
    puts "bbb #{bbb.weight}"

    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when 'HI','HI!','hi','hi!'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello!')
        when 'ping'
          bot.api.send_message(chat_id: message.chat.id, text: 'pong')
        when '/add'
          bot.api.send_message(chat_id: message.chat.id, text: 'pong')
        when '/info'
          bot.api.send_message(chat_id: message.chat.id, text: "健身房開始於2016-10-24, 已經過#{(Date.today - Date.parse('2016-10-24')).to_i}天")
        when /[~!@#$%^&*()_+\/\\]+/ # 簡單排除特殊字元
          bot.api.send_message(chat_id: message.chat.id, text: "無此指令")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "無法辨別")
        end
      end
    end
  end
end

