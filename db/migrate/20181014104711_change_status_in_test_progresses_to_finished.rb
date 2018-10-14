# frozen_string_literal: true

class ChangeStatusInTestProgressesToFinished < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_progresses, :status
    add_column :test_progresses, :finished, :boolean, default: false
  end
end
