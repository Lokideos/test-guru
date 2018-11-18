# frozen_string_literal: true

class AddNameToBadgeAcquisitionRules < ActiveRecord::Migration[5.2]
  def change
    add_column :badge_acquisition_rules, :name, :string, null: false
  end
end
