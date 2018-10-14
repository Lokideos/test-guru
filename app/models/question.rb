# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true

  validate :validate_answers_quantity

  private

  def validate_answers_quantity
    errors.add(:answers) if answers.size > 4 || answers.empty?
  end
end
