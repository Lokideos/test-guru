# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests, through: :progresses

  def tests_with_level(level)
    Test
      .where('level = :level', level: level)
      .where(id: Progress.where(user_id: id))
  end
end
