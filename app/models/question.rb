# frozen_string_literal: true

class Question < ApplicationRecord
  MAX_ANSWERS = 4

  has_many :answers
  belongs_to :test

  validates :body, presence: true

  validate :validate_answers_quantity_max
  validate :validate_answers_quantity_empty, on: :update

  private

  def validate_answers_quantity_max
    errors.add(:answers) if answers.size > MAX_ANSWERS
  end

  def validate_answers_quantity_empty
    errors.add(:answers) if answers.empty?
  end
end
