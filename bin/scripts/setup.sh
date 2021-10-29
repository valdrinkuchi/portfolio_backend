#!/bin/sh

set -e
env_var_ip_address=0.0.0.0
bin/rails db:migrate
rails s -b ${env_var_ip_address}