require 'github_api'

class GithubTester
  ACCEPT_SQUASH_MERGE_PREVIEW = 'application/vnd.github.polaris-preview'.freeze
  def initialize(user, repo, options)
    @user = user
    @repo = repo
    @client = Github.new(options)
  end

  def merge_pull_request(pull_request_number, params = {})
    path = "/repos/#{@user}/#{@repo}/pulls/#{pull_request_number}/merge"
    options = {
      :accept => ACCEPT_SQUASH_MERGE_PREVIEW,
      :merge_method => 'squash',
      :commit_title => params[:commit_title],
      :commit_message => params[:commit_message],
    }
    args = Github::ParamsHash.new(options)
    begin
      response = @client.put_request(path, args)
      puts response
    rescue => e
      puts e
    end
  end
end

gt = GithubTester.new('jduan', 'ruby_sandbox',
                      oauth_token: 'get your token from github.com')
gt.merge_pull_request(1,
                      commit_title: 'change last line',
                      commit_message: 'change last line message')
