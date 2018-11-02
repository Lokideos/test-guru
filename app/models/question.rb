# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  has_many :test_passages, foreign_key: :current_question_id
  has_many :gists
  belongs_to :test

  validates :body, presence: true

  def short_body(size)
    "#{body[0..size]}..."
  end
end
