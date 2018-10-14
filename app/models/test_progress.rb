# frozen_string_literal: true

class TestProgress < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
