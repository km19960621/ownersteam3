class OrdersController < ApplicationController
  before_action :login_required, except: [:index, :show]

  def index
    @orders = Order.page(params[:page]).per(ORDER_NUM).order(created_at: "DESC")
  end

  def new
    @user = current_user
    @order = Order.new
    @pitcher = @user.cards.all.where(pitcher: "true")
    @catcher = @user.cards.all.where(catcher: "true")
    @first = @user.cards.all.where(first: "true")
    @second = @user.cards.all.where(second: "true")
    @third = @user.cards.all.where(third: "true")
    @short = @user.cards.all.where(short: "true")
    @left = @user.cards.all.where(left: "true")
    @center = @user.cards.all.where(center: "true")
    @right = @user.cards.all.where(right: "true")
    @dh = @user.cards.all.where(dh: "true")
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save!
      redirect_to orders_path, success: 'オーダーを作成しました'
    else
      flash.now[:danger] = "オーダーの作成に失敗しました"
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    @user = current_user
    @pitcher = @user.cards.all.where(pitcher: "true")
    @catcher = @user.cards.all.where(catcher: "true")
    @first = @user.cards.all.where(first: "true")
    @second = @user.cards.all.where(second: "true")
    @third = @user.cards.all.where(third: "true")
    @short = @user.cards.all.where(short: "true")
    @left = @user.cards.all.where(left: "true")
    @center = @user.cards.all.where(center: "true")
    @right = @user.cards.all.where(right: "true")
    @dh = @user.cards.all.where(dh: "true")
  end

  def update
    order = Order.find(params[:id])
    order.update!(order_params)
    redirect_to "/users/#{order.user.id}", success: "オーダーを更新しました"
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to "/users/#{order.user.id}", success: "オーダーを削除しました"
  end

  def show
    @order = Order.find(params[:id])
    @user = @order.user
  end

  private
  def order_params
    params.require(:order).permit(:name, :pitcher_card_id, :catcher_card_id, :first_card_id, :second_card_id, :third_card_id, :short_card_id, :left_card_id, :center_card_id, :right_card_id, :dh_card_id)
  end
end
