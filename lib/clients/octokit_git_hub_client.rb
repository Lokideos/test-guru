# frozen_string_literal: true

class OctokitGitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(params)
    @http_client.post '/gists', params.to_json
  end
end
