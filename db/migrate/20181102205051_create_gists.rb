# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
