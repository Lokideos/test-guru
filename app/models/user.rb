# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :badge_acquisitions
  has_many :badges, through: :badge_acquisitions

  EMAIL_FORMAT = /\A[a-zA-Z0-9]*[@]{1}[a-z]*[.]{1}[a-z]{2,3}\z/

  validates :email, presence: true, uniqueness: true,
                    format: { with: EMAIL_FORMAT, message: 'must be valid email address' }

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
