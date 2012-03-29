
require 'sinatra'

get '/' do
  redirect '/wiki/index'
end

get %r{/wiki(/.*)} do |path|
  filename = get_filename(path)
  @content = File.open(filename, 'rb') { |f| f.read }
end

post %r{/wiki(/.*)} do |path|
  filename = get_filename(path)
  File.open(filename, 'w') { |f| f.write(params[:content]) }
end

def get_filename(path)
  path += 'index' if path =~ /\/$/
  filename = "pages#{path}.md"
  init_file(filename)
  filename
end

def init_file(fullpath)
  dname = File.dirname(fullpath)
  Dir.mkdir(dname) unless Dir.exists?(dname)
  File.open(fullpath, "w") {} unless File.exists?(fullpath)
end

