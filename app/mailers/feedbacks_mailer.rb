# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def ready_feedback(feedback, admins)
    @feedback = feedback

    admins.each do |admin|
      @user = admin

      mail to: @user.email
    end
  end
end
