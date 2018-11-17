# frozen_string_literal: true

class AddAcquisitionOptionsToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :acquisition_options, :string
  end
end
