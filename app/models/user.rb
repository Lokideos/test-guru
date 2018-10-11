# frozen_string_literal: true

class User < ApplicationRecord
  def tests_with_level(level)
    test_ids = Progress.where('user_id = :user_id', user_id: id).pluck(:id)
    Test.where('level = :level', level: level).where(id: test_ids)
  end
end
