# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  URL_FORMAT = %r{
    (http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?
    [a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?
  }x

  validates :url, presence: true
  validates :url, format: { with: URL_FORMAT }

  def hash(size)
    url[size..-1]
  end
end
