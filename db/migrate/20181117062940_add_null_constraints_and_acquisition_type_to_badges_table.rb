# frozen_string_literal: true

class AddNullConstraintsAndAcquisitionTypeToBadgesTable < ActiveRecord::Migration[5.2]
  def change
    change_column :badges, :name, :string, null: false
    change_column :badges, :icon_path, :string, null: false
    add_column :badges, :acquisition_type, :string, null: false
  end
end
