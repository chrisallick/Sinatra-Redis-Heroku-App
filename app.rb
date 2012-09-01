require 'rubygems'
require 'sinatra'
require 'erb'

configure do
	require 'redis'
	uri = URI.parse(ENV["REDISTOGO_URL"])
	REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
	REDIS.set("dope", "nachos")
	erb :index, :locals => {
  		:cool => REDIS.get("dope")
  	}
end
