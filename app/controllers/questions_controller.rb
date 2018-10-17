# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, except: :destroy
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

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

  def new; end

  def create
    @question = @test.questions.new(question_params)
    render inline: '<%= @question.body %> was successfully saved' if @question.save
  end

  def destroy
    @question.destroy

    render plain: 'Question was successfully destroyed'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'This question does not exist'
  end
end
