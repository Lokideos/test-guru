# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true

  def hash(size)
    url[size..-1]
  end
end
