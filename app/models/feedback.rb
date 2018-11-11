# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :text, presence: true
end
