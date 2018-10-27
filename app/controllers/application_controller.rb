# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def after_sign_in_path_for(_user)
    return admin_tests_path if current_user.admin?

    tests_path
  end

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
