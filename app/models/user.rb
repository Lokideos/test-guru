# frozen_string_literal: true

class User < ApplicationRecord
  def tests_with_level(level)
    Test.where('level = :level', level: level).where(id: Progress.where(user_id: id))
  end
end
