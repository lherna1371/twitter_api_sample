helpers do

  def tweets_stale?(time_created)
    ((Time.new - time_created) / 60) > 15
  end

  def fetch_tweets!(user)
    tweets = Twitter.user_timeline(user.username, count: 10)

    tweets.each do |item|
      user.tweets.create(tweet: item.text,
                         created_at: item.created_at)
      end
  end

end
