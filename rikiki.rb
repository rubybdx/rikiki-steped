
require 'sinatra'

get '/' do
  redirect '/wiki/index'
end

get %r{/wiki(/.*)} do |path|
end

post %r{/wiki(/.*)} do |path|
end


