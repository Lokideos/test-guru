# frozen_string_literal: true

class Test < ApplicationRecord
  class << self
    def with_category(category)
      category_id = Category.where('title = :category', category: category).pluck(:id).first
      where('category_id = :category_id',
            category_id: category_id).order(created_at: :desc).pluck(:title)
    end
  end
end
