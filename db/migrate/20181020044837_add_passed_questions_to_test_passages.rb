# frozen_string_literal: true

class AddPassedQuestionsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_passages, :finished, :boolean
    add_reference :test_passages, :current_question, index: true
    add_foreign_key :test_passages, :questions, column: :current_question_id
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
