# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :test_progresses
  has_many :users, through: :test_progresses
  belongs_to :category

  def self.with_category(category)
    joins(:category).where(categories: { title: category }).order(created_at: :desc).pluck(:title)
  end
end
