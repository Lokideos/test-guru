# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
