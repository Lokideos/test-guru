# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.string :url, null: false

      t.timestamps
    end
  end
end
