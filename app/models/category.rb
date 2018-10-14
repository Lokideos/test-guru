# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
end
