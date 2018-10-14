# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :test_progresses
  has_many :users, through: :test_progresses
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :with_level, ->(level) { where(level: level) }
  scope :easy, -> { with_level(0..1) }
  scope :normal, -> { with_level(2..4) }
  scope :brutal, -> { where('level >= ?', 5) }

  scope :with_category, lambda { |category|
                          joins(:category)
                            .where(categories: { title: category })
                            .by_date_reversed
                            .titles_only
                        }

  scope :by_date_reversed, -> { order(created_at: :desc) }
  scope :titles_only, -> { pluck(:title) }
end
