#  Copyright IBM Corporation 2018.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html

FROM ppedraza/iib

ENV BAR1=abc.bar
ENV script1=postconfig.sh
ENV cert1=Keystore.jks
ENV cert2=Trustore.jks

# Copy in the bar file to a temporary directory
#COPY --chown=aceuser $BAR1 /tmp
RUN mkdir /tmp/BARs
RUN mkdir /tmp/script
RUN mkdir /tmp/cert

COPY $BAR1 /tmp/BARs
COPY $script1 /tmp/script
COPY $cert1 /tmp/cert
COPY $cert2 /tmp/cert

#RUN sudo chown -R aceuser /tmp
RUN sudo chown -R iibuser /tmp
RUN sudo chmod 777 /tmp/script/*
RUN sudo chmod 777 /tmp/cert/*

# Copy odbc.ini file to a temporary directory
#COPY $ODBC /opt/ibm/ace-11.0.0.0/server/ODBC/unixodbc/
#COPY $ODBC /opt/ibm/iib-10.0.0.11/server/ODBC/unixodbc/

# Unzip the BAR file; need to use bash to make the profile work
#RUN bash -c 'mqsicreateworkdir /home/aceuser/ace-server && mqsibar -w /home/aceuser/ace-server -a /tmp/$BAR1 -c'

# Seteo conexion 
#RUN bash -c 'mqsisetdbparms -w /home/aceuser/ace-server -n $dbname -u $dbuser -p $dbpass'
