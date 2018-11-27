# frozen_string_literal: true

class AddTimerToTestsAndTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer
    add_column :test_passages, :completion_time, :datetime
  end
end
