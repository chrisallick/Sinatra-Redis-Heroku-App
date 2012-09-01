require 'rubygems'
require 'sinatra'
require 'erb'

configure do
  require 'redis'
  redisUri = ENV["REDISTOGO_URL"]
  uri = URI.parse(redisUri) 
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
	REDIS.set("dope", "nachos")
  erb :index, :locals => {
  	:cool => "dope"
  }
end
