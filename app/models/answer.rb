# frozen_string_literal: true

class Answer < ApplicationRecord
  before_destroy :validate_answers_quantity_for_question_empty

  MAX_ANSWERS = 4

  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_quantity_for_question_max

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_quantity_for_question_max
    errors.add(:question) if question.answers.size >= MAX_ANSWERS
  end

  def validate_answers_quantity_for_question_empty
    return if (question.answers.size - 1).positive?

    errors.add(:question)
    throw :abort
  end
end
