#!/bin/sh

set -e
env_var_ip_address=0.0.0.0
bin/rails db:migrate
bin/rails server -b ${env_var_ip_address}