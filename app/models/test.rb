# frozen_string_literal: true

class Test < ApplicationRecord
  EASY_MIN = 0
  EASY_MAX = 1
  NORMAL_MIN = 2
  NORMAL_MAX = 4
  BRUTAL_MIN = 5

  has_many :questions
  has_many :test_progresses
  has_many :users, through: :test_progresses
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }

  validate :validate_level_value

  scope :with_level, ->(level) { where(level: level) }
  scope :easy, -> { where(level: EASY_MIN..EASY_MAX) }
  scope :normal, -> { where(level: NORMAL_MIN..NORMAL_MAX) }
  scope :brutal, -> { where('level > ?', BRUTAL_MIN) }

  scope :with_category, lambda { |category|
                          joins(:category)
                            .where(categories: { title: category })
                            .by_date_reversed
                            .titles_only
                        }

  scope :by_date_reversed, -> { order(created_at: :desc) }
  scope :titles_only, -> { pluck(:title) }

  private

  def validate_level_value
    errors.add(:level) if level.to_i.negative?
  end
end
