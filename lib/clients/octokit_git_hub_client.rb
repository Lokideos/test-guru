# frozen_string_literal: true

class OctokitGitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '987ea3fdc64354e44bd10be4dba86ae38204f4a0'

  def initialize
    @http_client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.post '/gists', params.to_json
  end
end
