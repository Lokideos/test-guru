# frozen_string_literal: true

class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    change_column :users, :email, :string, null: false
  end
end