require 'sinatra'
require 'json'
require_relative 'LoadConfig'

config = load()

#TODO: load port from config
set :port, 8765  

post '/payload'  do
  #if its a push, we care about it.
  if env['HTTP_X_GITHUB_EVENT']=='push' then
        #Printing this stuff so i can debug easily
        webHook = JSON.parse(params[:payload])
        #lets check out what repo it was
        repo = webHook['repository']['url']
        script = config[repo]['script']
	puts script
	puts "Detected push to "+repo+" running script at "+script
        system script
  end
end
