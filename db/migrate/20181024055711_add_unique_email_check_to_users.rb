# frozen_string_literal: true

class AddUniqueEmailCheckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end
end
