# frozen_string_literal: true

class AddDefaultValueForTests < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :level, :integer, default: 0
  end
end
