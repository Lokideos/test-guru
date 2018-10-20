# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
