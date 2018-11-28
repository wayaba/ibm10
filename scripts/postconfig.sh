#!/bin/bash
# © Copyright IBM Corporation 2015.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html

echo $PATH

echo "----------------------------------------"
echo "Seteo el entorno ............................................."
. /opt/ibm/iib-10.0.0.11/server/bin/mqsiprofile


echo $PATH
echo "----------------------------------------"
echo "Agrego keystore ............................................."
echo "----------------------------------------"
mqsichangeproperties MYNODE -o BrokerRegistry -n  brokerKeystoreFile -v /tmp/cert/Keystore.jks
  
echo "Agrego truestore ............................................."
echo "----------------------------------------"
mqsichangeproperties MYNODE -o BrokerRegistry -n brokerTruststoreFile -v /tmp/cert/Truestore.jks