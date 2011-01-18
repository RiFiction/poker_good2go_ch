load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['lib/recipes/*.rb'].each { |receipe| load(receipe) }
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

# RVM
#require 'rvm/capistrano'
#set :rvm_ruby_string, '1.9.2'
