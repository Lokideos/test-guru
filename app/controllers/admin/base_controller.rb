# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    flash[:alert] = 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
    redirect_to root_path
  end
end
