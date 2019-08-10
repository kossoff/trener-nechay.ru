# frozen_string_literal: true

class Order < ApplicationRecord
  after_create :send_notification

  private

  def send_notification
    NotificationMailer.new_order(self).deliver
  end
end
