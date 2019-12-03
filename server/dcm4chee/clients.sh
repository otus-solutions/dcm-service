#!/bin/bash

RESULT=`$(URL=${URL}) curl -k \
--url $URL \
--data 'grant_type=password' \
--data 'username=admin' \
--data 'password=admin' \
--data 'client_id=admin-cli' `


TOKEN=`echo $RESULT | sed 's/.*access_token":"\([^"]*\).*/\1/'`

$(URL2=${URL2}) curl -k -X  POST \
  --url $URL2 \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{
 "id":"DCM-1",
 "clientId":"dcm4chee-arc-ui",
 "name": "dcm4chee-arc-ui",
 "description": "dcm4chee-arc-ui",
 "enabled": true,
 "redirectUris":[ "'$URL_ARC'/*" ],
 "publicClient": true
 }'

$(URL2=${URL2}) curl -k -X  POST \
  --url $URL2 \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{
 "id":"DCM-2",
 "clientId":"wildfly-console",
 "name": "wildfly-console",
 "description": "wildfly-console",
 "enabled": true,
 "redirectUris":[ "'$URL_WF'/*" ],
 "publicClient": true
 }'

 $(URL2=${URL2}) curl -k -X  POST \
  --url $URL2 \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{
 "id":"DCM-3",
 "clientId":"kibana",
 "name": "kibana",
 "description": "kibana",
 "enabled": true,
 "redirectUris":[ "'$URL_KB'/*" ],
 "publicClient": false,
 "clientAuthenticatorType": "client-secret",
 "secret": "123456"
 }'


 $(URL2=${URL2}) curl -k -X  POST \
  --url $URL2 \
  -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' \
  -d '{
      "id": "DCM-4",
      "clientId": "curl",
      "enabled": true,
      "clientAuthenticatorType": "client-secret",
      "secret": "123456",
      "directAccessGrantsEnabled": true,
      "standardFlowEnabled": false,
      "serviceAccountsEnabled": true,
      "publicClient": false
}'