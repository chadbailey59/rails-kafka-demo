class UsersController < ApplicationController
  before_filter :require_user!, only: [:me, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path, notice: "User created."
    else
      flash[:error] = "Sorry, I couldn't create your account: #{@user.errors.full_messages.join('; ')}"
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to :back, notice: 'User updated.'
    else
      flash[:error] = "Sorry, I couldn't update your account: #{@user.errors.full_messages.join('; ')}"
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      attrs = [:name, :email, :password, :password_confirmation, :token]
      params.require(:user).permit(*attrs)
    end
end
