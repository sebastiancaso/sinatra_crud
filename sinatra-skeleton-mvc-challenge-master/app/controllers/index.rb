get '/' do
  erb :index
end

get '/register' do

  erb :new
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/user'
  else
    @errors = "your login information is incorrect"
    redirect '/'
  end
end


get '/login' do

  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/user'
    else
      @errors = "incorrect login information"
      erb :login
    end
end

get '/user' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  erb :show
  else
  redirect '/'
  end
end

put '/user/edit' do
    @user = User.find(session[:user_id])
    @user.update(params[:user])
  # if xhr?
    content_type :json
    @user.to_json #the response that goes to json...
  # else
    # redirect '/user'
  # end
end

get '/user/edit' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :edit
  else
    redirect '/'
  end
end




get '/logout' do
  session.clear
  redirect '/'
end

delete '/user' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    redirect to '/'
  else
    redirect to '/'
  end
end


