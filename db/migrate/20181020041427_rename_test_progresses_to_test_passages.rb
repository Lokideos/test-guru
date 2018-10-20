# frozen_string_literal: true

class RenameTestProgressesToTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_table :test_progresses, :test_passages
  end
end
