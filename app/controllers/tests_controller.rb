# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    passage = TestPassage.new(user: current_user, test: @test)
    passage.set_timer
    passage.save

    redirect_to current_user.test_passages.last_test_entry(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
