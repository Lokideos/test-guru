# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to after_login_url
    else
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def destroy
    session[:user_id] = ''
    redirect_to root_path
  end

  private

  def after_login_url
    return cookies[:current_path] if cookies[:current_path]

    root_path
  end
end
