
require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  redirect '/wiki/index'
end

get %r{/wiki(/.*)} do |path|
  path,filename = filename_path(path)
  @content = File.open(filename, 'rb') { |f| f.read }
  haml :main
end

post %r{/wiki(/.*)} do |path|
  path,filename = filename_path(path)
  File.open(filename, 'w') { |f| f.write(params[:content]) }
  redirect "/wiki#{path}"
end

def filename_path(path)
  path += 'index' if path =~ /\/$/
  filename = "pages#{path}.md"
  init_file(filename)
  [path,filename]
end

def init_file(fullpath)
  dname = File.dirname(fullpath)
  Dir.mkdir(dname) unless Dir.exists?(dname)
  File.open(fullpath, "w") {} unless File.exists?(fullpath)
end

