# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :icon_path

      t.timestamps
    end
  end
end
