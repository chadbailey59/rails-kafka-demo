class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(session_params[:email], session_params[:password])
    if @user
      sign_in @user
      redirect_to root_path, notice: "Welcome back!"
    else
      redirect_to :back, flash: {error: "Sorry, I couldn't find a user with that email and password."}
    end
  end

  def destroy
    cookies.permanent.signed[:u] = {value: nil, domain: :all}
    redirect_to root_url, notice: "Signed out."
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
