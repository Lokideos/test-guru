# frozen_string_literal: true

class BadgeAcquisition < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
