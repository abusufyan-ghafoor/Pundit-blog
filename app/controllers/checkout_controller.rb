class CheckoutController < ApplicationController
  def index
    order = current_user.orders.last
  end
  def create
    @order = Order.find_by(id: params[:cheeck])
    ord_det = @order.order_details.all 
    arr1 = []
    Stripe.api_key = 'sk_test_51Jl9aAAksKRBwugxuzZQuVHbk5XP5XSuVrmasVed1c4QcDPhAdKuIfugdsMCwTpnXrbZILpsjnZGqZwKLkSaHi1900I76wHIc7'
        ord_det.each do |ord|
          
          qty = ord.quantity
          product = ord.product
          arr1 << {
            name: product.name,
            amount: product.price,
            currency: "usd",
            quantity: qty
          }
        end
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: arr1,
        mode: 'payment',
        success_url: orders_url(id: @order.id),
        cancel_url: root_url
      })

      redirect_to session.url
  end
end
