
require 'sinatra'

get '/' do
  redirect '/wiki/index'
end

get %r{/wiki(/.*)} do |path|
  filename = get_filename(path)
end

post %r{/wiki(/.*)} do |path|
  filename = get_filename(path)
end

def get_filename(path)
  path += 'index' if path =~ /\/$/
  filename = "pages#{path}.md"
  filename
end

