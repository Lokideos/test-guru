# frozen_string_literal: true

class BadgeAcquisitionRule < ApplicationRecord
  has_many :badges

  validates :acquisition_type, presence: true
end
