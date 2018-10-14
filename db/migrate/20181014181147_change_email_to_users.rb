# frozen_string_literal: true

class ChangeEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string, null: false
  end
end
