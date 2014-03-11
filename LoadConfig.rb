require 'json'

def load()
  #Set the default config location.
  configPath = "repos.json"

  #TODO: Check for a configfile as an arg

  #Check if the configFile exists
  if FileTest.exist?(configPath) then
    puts "Using config File: "+configPath	
    #now we check that it is a valid config and load the shiz
    configFile = File.read(configPath)
    config = JSON.parse(configFile)
    return config
  else
    puts "File: "+configPath+" does not exist"
    return false
  end
end

