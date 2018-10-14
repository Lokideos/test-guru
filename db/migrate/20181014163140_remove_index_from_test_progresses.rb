# frozen_string_literal: true

class RemoveIndexFromTestProgresses < ActiveRecord::Migration[5.2]
  def change
    remove_index :test_progresses, %i[user_id test_id]
  end
end
