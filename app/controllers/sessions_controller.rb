# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to login_path
  end

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies[:start_path] = root_path
      redirect_to cookies[:start_path]
    else
      flash[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new # , alert: 'Are you a Guru? Verify your Email and Password please'  - doesn't work
    end
  end

  def destroy
    session[:user_id] = ''
    redirect_to root_path
  end
end
