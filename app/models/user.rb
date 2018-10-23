# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  EMAIL_FORMAT = /\A[a-zA-Z]*[@]{1}[a-z]*[.]{1}[a-z]{2,3}\z/

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT,
                              message: 'must be valid email address' }

  has_secure_password

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end
end
