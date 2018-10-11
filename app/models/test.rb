# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :users, through: :progresses
  belongs_to :category

  def self.with_category(category)
    where(category_id: Category.where('title = :category', category: category).first)
      .order(created_at: :desc)
      .pluck(:title)
  end
end
