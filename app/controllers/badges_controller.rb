# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badge_types = Badge.all
    @badges = current_user.badges
  end
end
