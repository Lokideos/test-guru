# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id,
                                optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question

  scope :last_test_entry, ->(test) { where(test_id: test).last }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def test_passed?
    (correct_questions / test.questions.count * 100).floor >= 85
  end

  def current_question_number(question)
    test.questions.index(question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort

    # I will leave former method realization here
    # to look up it later. If you don't mind ofc.

    # correct_answers_count = correct_answers.count

    # (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    #   correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
