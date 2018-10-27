# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mail@testguru.com'
  layout 'mailer'
end
