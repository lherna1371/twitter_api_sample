#--GET----------------------------------------------------

get '/' do

  erb :index
end


#--POST----------------------------------------------------

post '/tweets' do
  
  @timeline = Twitter.user_timeline(params[:username])

  @tweets = @timeline.map { |item| item[:text] }

  erb :tweets

end
