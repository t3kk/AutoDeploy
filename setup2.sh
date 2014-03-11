#ssh-keygen -t rsa -C "autoDeploy@example.com"
echo "\n\n\n"
echo "copy and paste this to github"
echo
cat $HOME/.ssh/id_rsa.pub
echo

