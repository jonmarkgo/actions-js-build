#!/bin/sh

if [ "$DEBUG" = "false" ]
then
  # Carry on, but do quit on errors
  set -e
else
  # Verbose debugging
  set -exuo pipefail
  export LOG_LEVEL=debug
  export ACTIONS_STEP_DEBUG=true
fi


if [ ! -z "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

echo "updating Gems"
gem update --system
echo "installing bundler"
gem install bundler
echo "running bundle install"
bundle _2.1.4_ install
echo "Installing NPM dependencies"
npm config set unsafe-perm true
npm install
echo "Finished installing, moving on to gulp"

# First try Gulp, then try Grunt
# Gulpfile.js can be a file or a directory:
if [ -e "gulpfile.js" ]
then 
  npm install -g gulp-cli
  echo "Running Gulp with args"
  sh -c "gulp $*"
# Gruntfile can be js or coffeescript file
elif [ -f "Gruntfile.js" -o -f "Gruntfile.coffee" ]
then 
  npm install -g grunt-cli
  echo "Running Grunt with args"
  sh -c "grunt $*"
else
  echo "Running NPM with args"
  sh -c "npm $*"
fi
