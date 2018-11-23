# frozen_string_literal: true

class CreateBadgeAcquisitions < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_acquisitions do |t|
      t.belongs_to :user
      t.belongs_to :badge

      t.timestamps
    end
  end
end
