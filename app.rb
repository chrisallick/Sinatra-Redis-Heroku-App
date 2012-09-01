require 'rubygems'
require 'sinatra'
require 'erb'
require 'redis'

configure do
  redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
  uri = URI.parse(redisUri) 
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
	REDIS.set("dope", "nachos")
  	erb :index, :locals => {
  		:cool => REDIS.get("dope")
  	}
end
