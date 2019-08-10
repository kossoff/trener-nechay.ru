# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def new_order(order)
    @order = order
    mail(to: [@order.email, ENV['SITE_EMAIL']], subject: 'Заявка: ' + @order.item_title)
  end
end
