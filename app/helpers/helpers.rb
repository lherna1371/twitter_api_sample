helpers do

  def fetch_tweets!(user)
    timeline = Twitter.user_timeline(user)

    timeline.map { |item| item[:text] }

  end

end
