# frozen_string_literal: true

class AddUniqueIndexCheckToTestPorgresses < ActiveRecord::Migration[5.2]
  def change
    add_index :test_progresses, %i[user_id test_id], unique: true
  end
end
