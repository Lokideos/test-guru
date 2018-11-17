# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_acquisitions
  has_many :users, through: :badge_acquisitions

  validates :name, :icon_path, presence: true

  def self.check_acquire_conditions
    all.first
  end

  def all_tests_of_category_correct?(category)
    all_tests_of_category_complete = true

    Test.by_category(category).each do |test|
      TestPassage.where(test_id: test.id).where(user_id: user.id).each do |passage|
        all_tests_of_category_complete = false unless passage.test_passed?
      end
    end

    all_tests_of_category_complete
  end
end
