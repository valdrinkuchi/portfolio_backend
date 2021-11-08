#!/bin/sh

set -e
env_var_ip_address=0.0.0.0
rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:setup
bin/rails server -b ${env_var_ip_address}