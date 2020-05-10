class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create, :show, :cards]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'ユーザー登録しました'
      log_in @user
    else
      flash.now[:danger] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to user_path, success: "ユーザー情報を更新しました"
  end

  def destroy
    @user = User.find_by(id: params[:id])
    redirect_to root_path, success: "アカウントを削除しました"
    log_out @user
  end

  def cards
    @user = User.find(params[:id])
    @cards = @user.cards.page(params[:page]).per(CARD_NUM).order(:image)
  end

  def orders
    @orders = Order.page(params[:page]).per(ORDER_NUM).order(created_at: "DESC")
  end

  def random_orders
    @user = User.find(params[:id])
    @cards = @user.cards.all
    @pitchers = @cards.where(pitcher: "true")
    @catchers = @cards.where(catcher: "true")
    @firsts = @cards.where(first: "true")
    @seconds = @cards.where(second: "true")
    @thirds = @cards.where(third: "true")
    @shorts = @cards.where(short: "true")
    @lefts = @cards.where(left: "true")
    @centers = @cards.where(center: "true")
    @rights = @cards.where(right: "true")
    @dhs = @cards.where(dh: "true")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
