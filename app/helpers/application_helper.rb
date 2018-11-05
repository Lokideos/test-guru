# frozen_string_literal: true

module ApplicationHelper
  FLASH_TYPES = {
    notice: 'alert-success',
    alert: 'alert-danger',
    gist_create: 'alert-primary'
  }.freeze

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to(repo.capitalize.to_s, "https://github.com/#{author}/#{repo}", target: '_blank')
  end

  def flash_message(type, message)
    content_tag :div, class: "alert #{FLASH_TYPES[type.to_sym]}" do
      if type.to_sym == :gist_create
        link_to t('helper_methods.application.flash_message.gist_created') +
                ": #{message.slice(24..message.length)}", message, target: '_blank'
      elsif flash[type.to_sym]
        content_tag(:p, message)
      end
    end
  end
end
