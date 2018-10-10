# frozen_string_literal: true

class AddNullCheckToEverything < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :title, :string, null: false
    change_column :tests, :level, :integer, null: false
    change_column :questions, :body, :string, null: false
    change_column :answers, :body, :string, null: false
    change_column :answers, :correct, :boolean, null: false
    change_column :categories, :title, :string, null: false
    change_column :users, :name, :string, null: false
    change_column :users, :role, :string, null: false
  end
end
