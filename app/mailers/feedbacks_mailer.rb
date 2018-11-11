# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def ready_feedback(feedback, user)
    @user = user
    @feedback = feedback

    mail to: @user.email
  end
end
