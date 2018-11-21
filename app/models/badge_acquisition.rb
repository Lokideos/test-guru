# frozen_string_literal: true

class BadgeAcquisition < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  RECENT_SECONDS = 3

  scope :recently_created, -> { where('created_at >= ?', RECENT_SECONDS.second.ago) }
end
