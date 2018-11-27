# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id,
                                optional: true

  before_validation :before_validation_set_next_question

  scope :last_test_entry, ->(test) { where(test_id: test).last }

  PASS_TEST_THRESHOLD = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def test_passed?
    (correct_questions / test.questions.count * 100).floor >= PASS_TEST_THRESHOLD
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def set_timer
    return unless test.timer

    self.completion_time = Time.now + test.timer unless completion_time
  end

  def set_timer!
    set_timer
    save!
  end

  def finish_test
    self.current_question = nil
  end

  def time_is_up?
    (completion_time - Time.now).negative? if completion_time
  end

  private

  def before_validation_set_next_question
    return self.current_question = test.questions.first if test.present? && current_question.nil?

    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
