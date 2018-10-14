# frozen_string_literal: true

class Question < ApplicationRecord
  MAX_ANSWERS = 4

  has_many :answers
  belongs_to :test

  validates :body, presence: true

  validate :validate_answers_quantity

  private

  def validate_answers_quantity
    errors.add(:answers) if answers.size > MAX_ANSWERS || answers.empty?
  end
end
