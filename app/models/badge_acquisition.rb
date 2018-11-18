# frozen_string_literal: true

class BadgeAcquisition < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :recently_created, -> { where('created_at >= ?', 5.second.ago) }
end
