class HomeController < ApplicationController
  def index
    render inertia: 'Home', props: {
      git: {
        commit_time: ENV['COMMIT_TIME'] || Time.current.to_s,
        commit_sha:  ENV['COMMIT_SHA'] ? ENV['COMMIT_SHA'].first(7) : 'development',
        commit_url:  ENV['COMMIT_SHA'] ? "https://github.com/ledermann/workcation/commit/#{ENV['COMMIT_SHA']}" : 'https://github.com/ledermann/workcation'
      }
    }
  end
end
