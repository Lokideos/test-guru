# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show]
  before_action :find_question, only: :show

  def index
    render inline: '<%= @test.questions.all.pluck(:body) %>'
  end

  def show
    if @test.questions.include? @question
      render inline: '<%= @question.body %>'
    else
      render plain: 'There is no such question for this test'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
