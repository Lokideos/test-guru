# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
