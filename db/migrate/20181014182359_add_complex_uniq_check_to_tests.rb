# frozen_string_literal: true

class AddComplexUniqCheckToTests < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
