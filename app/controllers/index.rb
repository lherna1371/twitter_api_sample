#--GET----------------------------------------------------

get '/' do

  erb :index
end

get '/:username' do
  @username = params[:username]

  @user = TwitterUser.find_or_create_by_username(@username)
  
  if @user.tweets.empty? || tweets_stale?(@user.tweets.first.created_at)
  
    fetch_tweets!(@user)
  end

  @tweets = @user.tweets.limit(10)

  erb :tweets
end

# get '/:username' do

#   @username = params[:username]
  
#   @timeline = Twitter.user_timeline(@user)

#   @tweets = @timeline.map { |item| item[:text] }

#   erb :tweets

# end


#--POST----------------------------------------------------

post '/tweets' do

redirect "/#{params[:username]}"

end
