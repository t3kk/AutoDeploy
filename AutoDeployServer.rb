require 'sinatra'
require 'json'
require_relative 'LoadConfig'

config = load()
#this will start up the servers before we start listening.
config["repos"].each do |repo|
  puts "Executing startScript for "+repo["name"]
  system "cd "+repo["workingDir"]+" && "+repo["startScript"]+" &"
  puts "Done"
end


#TODO: load port from config
set :port, 8765  

post '/payload'  do
  #if its a push, we care about it.
  if env['HTTP_X_GITHUB_EVENT']=='push' then
    #Printing this stuff so i can debug easily
    webHook = JSON.parse(params[:payload])
    #lets check out what repo it was
    payloadRepo = webHook['repository']['url']
    config["repos"].each do |repo|
      if (repo["name"]==payloadRepo) then
        script = repo['script']
        puts script
        puts "Detected push to "+payloadRepo+" running script at "+script
        system "cd "+repo["workingDir"]+" && "+repo["script"]+" &"
      end
    end
  end
end
