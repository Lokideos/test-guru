# frozen_string_literal: true

class AddRelationToAcqusitionRuleToBadges < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :badges, :badge_acquisition_rule, foreign_key: true
    remove_column :badges, :acquisition_type
    remove_column :badges, :acquisition_options
  end
end
