class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: [:show, :new, :create]
  # before_action :create_order_and, only: :show

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    render_wizard
  end

  def new

  end

  def create
    @order = Order.create(user_id: current_user.id)
    add_line_items_to_order_from_cart(@cart)
    destroy_cart

    @form = Forms::CheckoutForm.new

    respond_to do |format|
      if @form.valid?
        format.html { redirect_to next_wizard_path, notice:
        'Address has been successfully saved' }
        # format.json { render :show, status: :created,
        # location: @order }
      else
        format.html { redirect_to wizard_path }
        # format.json { render json: @order.errors,
        # status: :unprocessable_entity }
      end
    end





    # respond_to do |format|
    #   if @order.save
    #     Cart.destroy(session[:cart_id])
    #     session[:cart_id] = nil
    #     format.html { redirect_to store_index_url, notice:
    #     'Thank you for your order.' }
    #     format.json { render :show, status: :created,
    #     location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors,
    #     status: :unprocessable_entity }
    #   end
    # end

  end




  private

    def ensure_cart_isnt_empty
      redirect_to(books_url, notice: 'Your cart is empty') unless @cart.line_items.any?
    end

    def add_line_items_to_order_from_cart(cart)
      cart.line_items.each do |item|
        item.update(cart_id: nil, order_id: @order.id)
        # line_items << item
      end
    end

    def destroy_cart
      # return unless @cart
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
    end
end
