# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def ready_feedback(feedback, admins)
    admins.each do |admin|
      @user = admin
      @feedback = feedback

      mail to: @user.email
    end
  end
end
