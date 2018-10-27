# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_user)
    return admin_tests_path if current_user.is_a?(Admin)

    tests_path
  end
end
