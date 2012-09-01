require 'rubygems'
require 'sinatra'
require 'erb'

configure do
	require 'redis'
	redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
	uri = URI.parse(redisUri) 
	REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
	REDIS.sadd("dope", "nachos")
	erb :index, :locals =>
  		:cool => "dude"
end
