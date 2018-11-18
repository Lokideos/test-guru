# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result
    @badges = []

    current_user.badge_acquisitions.recently_created.each do |acquisition|
      @badges << acquisition.badge
    end

    @badges
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      current_user.badges.push(Badge.check_acquire_conditions(@test_passage))

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    make_gist(service)

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def make_gist(service)
    git_response = service.call

    current_user.gists.create(question: @test_passage.current_question,
                              url: git_response.html_url)
    flash[:gist_create] = git_response.html_url
  rescue StandardError => e
    flash[:alert] = "#{t('.failure')}. #{t('.error_reason')}: #{e.response_status}"
  end
end
