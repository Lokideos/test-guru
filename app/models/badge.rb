# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_acquisitions
  has_many :users, through: :badge_acquisitions

  validates :name, :icon_path, :acquisition_type, presence: true

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.check_acquire_conditions(test_passage)
    badges = []

    if all_tests_of_category_done?(test_passage.test.category.title, test_passage.user)
      Badge.where(acquisition_type: 'category',
                  acquisition_options: test_passage.test.category.title).each do |badge|
        badges << badge
      end
    end

    if first_try_success?(test_passage.test, test_passage.user)
      Badge.where(acquisition_type: 'first_try').each do |badge|
        badges << badge
      end
    end

    if all_tests_of_level_done?(test_passage.test.level, test_passage.user)
      Badge.where(acquisition_type: 'level',
                  acquisition_options: test_passage.test.level).each do |badge|
        badges << badge
      end
    end

    badges
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def self.all_tests_of_category_done?(category, user)
    all_tests_of_category_done = false

    Test.by_category(category).each do |test|
      return all_tests_of_category_done = false if TestPassage.where(test_id: test.id).first.nil?

      TestPassage.where(test_id: test.id).where(user_id: user.id).each do |passage|
        all_tests_of_category_done = true if passage.test_passed?
      end
    end

    all_tests_of_category_done
  end

  def self.first_try_success?(test, user)
    first_try_success = false
    passages = TestPassage.where(test_id: test.id).where(user_id: user.id)

    if passages.count == 1
      first_try_success = true if passages.first.test_passed?
    end

    first_try_success
  end

  def self.all_tests_of_level_done?(level, user)
    all_tests_of_level_done = false

    Test.with_level(level).each do |test|
      return all_tests_of_level_done = false if TestPassage.where(test_id: test.id).first.nil?

      TestPassage.where(test_id: test.id, user_id: user.id).each do |passage|
        all_tests_of_level_done = true if passage.test_passed?
      end
    end

    all_tests_of_level_done
  end
end
