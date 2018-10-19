# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to(repo.capitalize.to_s, "https://github.com/#{author}/#{repo}", target: '_blank')
  end
end
