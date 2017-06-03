require 'sinatra'

set :bind, '0.0.0.0'
enable :sessions

get '/' do
    erb :index
end

post '/begin' do
    session[:name] = params[:name]
    session[:health] = 5
    session[:monster] = 5
    erb :begin
end

get '/begin' do
    erb :begin
end

get '/door1' do
    erb :door1
end

get '/door2' do
    erb :door2
end

get '/fight' do
    erb :fight
end

get '/attack' do
    damage = rand(3)
    session[:monster] = session[:monster] - damage
    
    damage = rand(2)
    session[:health] = session[:health] - damage
    
    if session[:monster] <= 0
        erb :won
    elsif session[:health] <= 0
        erb :lost
    else
        erb :fight
    end
end