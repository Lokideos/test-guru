# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    Admin.all.each do |admin|
      FeedbacksMailer.ready_feedback(@feedback, admin).deliver_now
    end

    redirect_to root_path, notice: t('.success')
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text)
  end
end
