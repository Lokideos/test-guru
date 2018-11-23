# frozen_string_literal: true

class CreateBadgeAcquisitionRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_acquisition_rules do |t|
      t.string :acquisition_type, null: false
      t.string :acquisition_options

      t.timestamps
    end
  end
end
