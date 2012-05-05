# -*- coding:utf-8 -*-
class MasterMailer < ActionMailer::Base
  default from: "hyshhryk+ohiru@gmail.com"

  def daily(user)
    mail_to = user.email
    subject = "[ohiru] ランチのお店の提案（#{Time.now.in_time_zone('Tokyo').strftime("%Y年%m月%d日")}更新分）が届きました"

    # override "mail_to" in the staging env
    mail_to = 'hyshhryk@gmail.com' if Rails.env.staging?

    mail(to: mail_to, subject: subject)
  end
end
