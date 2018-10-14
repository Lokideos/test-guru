# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  belongs_to :test
end
