#! /home/crime/.rvm/bin/ruby-rvm-env
# -*- coding: utf-8 -*-

=begin Read path to Ruby:

firts line is called the shebang line, whenever your computer tries to
read a script, this line tells the computer what program
to run this script with.
You have to change the 1st line, some people might be using RVM, or have it
installed in  "/home/hostname/.rvm/bin/ruby-rvm-env"
or change "/usr/bin/env ruby"

=end

# Ruby script for github API with octokit lib.
# See more http://octokit.github.io/octokit.rb

kit = <<'GitHub'
   _______ __     __  __      __       ___    ____  ____
  / ____(_) /_   / / / /_  __/ /_     /   |  / __ \/  _/
 / / __/ / __/  / /_/ / / / / __ \   / /| | / /_/ // /
/ /_/ / / /_   / __  / /_/ / /_/ /  / ___ |/ ____// /
\____/_/\__/  /_/ /_/\__,_/_.___/  /_/  |_/_/   /___/

GitHub
puts kit

# Gem install ockokit
require 'octokit'

# Provide authentication credentials
  Octokit.configure do |c|
    c.login = 'login'
    c.password = 'passwd'
  end

# Fetch the current user
Octokit.user

# Fetch a other user
user = Octokit.user 'Ctyode'
puts user.name
#puts user.fields
# => <Set: {:login, :id, :gravatar_id, :type, :name, :company, :blog, :location, :email, :hireable, :bio, :public_repos, :followers, :following, :created_at, :updated_at, :public_gists}>
puts user[:type]
puts user[:id]
puts user[:location]
puts user[:bio]
puts user[:company]
puts user[:public_repos]
puts user[:email]
puts user[:created_at]
user.rels[:gists].href

# Uncomment to show the detail debug log
#stack = Faraday::RackBuilder.new do |builder|
#  builder.response :logger
#  builder.use Octokit::Response::RaiseError
#  builder.adapter Faraday.default_adapter
#end
#Octokit.middleware = stack
#Octokit.user 'user_name'
