# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order[:item_title] = params.fetch(:item_title)
  end

  def create
    @order = Order.new(order_params)

    render partial: 'orders/response' if @order.save
  end

  private

  def order_params
    params.require(:order).permit(:item_title, :name, :email, :phone, :note)
  end
end
