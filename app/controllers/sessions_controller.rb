# frozen_string_literal: true

class SessionsController < ApplicationController
  def index
    redirect_to login_path
  end

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new # , alert: 'Are you a Guru? Verify your Email and Password please'  - doesn't work
    end
  end
end
