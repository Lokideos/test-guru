# frozen_string_literal: true

class Test < ApplicationRecord
  def self.with_category(category)
    where('category_id = :category_id', category_id:
          Category.where('title = :category', category: category).first).order(
            created_at: :desc
          ).pluck(:title)
  end
end
