class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def sign_in(user)
    cookies.permanent.signed[:u] = {value: user.id, domain: :all}
  end

  def current_user
    begin
      @current_user ||= User.find(cookies.signed[:u]) if cookies.signed[:u]
    rescue ActiveRecord::RecordNotFound => e
      cookies.signed[:u] = nil
      nil
    end
  end

  def require_user!
    return redirect_to(sign_in_path, notice: 'You must be signed in to do that.') unless current_user
    return redirect_to(confirm_users_path) unless current_user.confirmed?
  end
end
