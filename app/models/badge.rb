# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_acquisitions
  has_many :users, through: :badge_acquisitions

  validates :name, :icon_path, presence: true

  def self.check_acquire_conditions
    all.first
  end
end
