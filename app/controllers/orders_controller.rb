class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :checkout, :add_item, :delete_item, :create_item]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  # def show
  # end

  # GET /orders/new
  def new
    @order = Order.new
    @order.start_time = DateTime.now.strftime('%Y-%m-%d %a %H:%M:%S')
    @order.save
    redirect_to orders_url
  end

  # GET /orders/1/edit
  # def edit
  # end

  # POST /orders
  # POST /orders.json
  # def create
    # @order = Order.new(order_params)

    # respond_to do |format|
      # if @order.save
        # format.html { redirect_to @order, notice: 'Order was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @order }
      # else
        # format.html { render action: 'new' }
        # format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
  #   end
  # end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def checkout
    @order.end_time = DateTime.now.strftime('%Y-%m-%d %a %H:%M:%S')
    @order.time_cost = @order.time_price
    @order.product_cost = @order.products_price
    @order.total_cost = @order.time_cost + @order.product_cost 

    @order.save
    redirect_to orders_url
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def add_item
    @order_item = @order.order_items.build 
  end

  def create_item
    @exist_order_item_with_same_product_id = @order.order_items.find_by product_id: params[:order_item][:product_id]
    if @exist_order_item_with_same_product_id.nil?
      @order_item = @order.order_items.build(order_item_params)
      @order_item.save
    else
      if params[:order_item][:amount].to_i > 0
        @exist_order_item_with_same_product_id.amount += params[:order_item][:amount].to_i
        @exist_order_item_with_same_product_id.save
      end
    end
    @order.product_cost = @order.products_price
    # binding.pry
    @order.save

    redirect_to action: :add_item
  end

  def delete_item
    @order_item = @order.order_items.find(params[:item_id])
    @order_item.destroy

    redirect_to action: :add_item
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:start_time, :end_time, :difftime, :cost)
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :amount, :order_id)
    end
end
