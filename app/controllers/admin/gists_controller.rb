# frozen_string_literal: true

class GistsController < ApplicationController
  def index
    @gists = Gist.all
  end
end
