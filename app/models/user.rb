# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_progresses
  has_many :tests, through: :test_progresses
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
end
