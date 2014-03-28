sudo adduser --system autodeploy
sudo su -s /bin/sh -c "sh setup2.sh" autodeploy
sudo apt-get install ruby
sudo gem install sinatra
