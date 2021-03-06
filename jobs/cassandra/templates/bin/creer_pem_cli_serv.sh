#!/bin/bash

set -e # exit immediately if a simple command exits with a non-zero status.
set -u # report the usage of uninitialized variables.

pushd `dirname $(readlink --canonicalize-existing $0)` >/dev/null
export CASSANDRA_SSL=/var/vcap/jobs/cassandra/config/certs
cd ${CASSANDRA_SSL}

encryption=<%= p("client_encryption.enabled") %>

if [ "$encryption" == true ]; then
 /var/vcap/jobs/cassandra/config/certs/./ssl_env.ctl
fi

popd >/dev/null
exit 0
