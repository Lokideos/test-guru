# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_acquisitions
  has_many :users, through: :badge_acquisitions
  belongs_to :badge_acquisition_rule

  validates :name, :icon_path, presence: true
end
