#!/bin/bash

groupID="43f6b5ed-cb86-4cdc-abef-f0d205e9fca7" 
datasetID="0e074d27-adcd-4290-a08e-4aa375e51801"
clientId="b759774c-6f25-4860-a0cf-7fc4b9a8dc24"

function getAuthToken {
    resourceAppIdURI="https://analysis.windows.net/powerbi/api"
    authority="https://login.microsoftonline.com/common/oauth2/authorize"
    redirectUri="urn:ietf:wg:oauth:2.0:oob"

    token=$(curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=$clientId&redirect_uri=$redirectUri&resource=$resourceAppIdURI&grant_type=client_credentials" $authority)
    access_token=$(echo $token | jq -r '.access_token')
    echo $access_token
}

token=$(getAuthToken)

authHeader="Authorization: Bearer $token"

if [ "$groupID" == "me" ]; then
    groupsPath="myorg"
else
    groupsPath="myorg/groups/$groupID"
fi

uri="https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
curl -X POST -H "Content-Type: application/json" -H "$authHeader" -d '{}' $uri


uri="https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
curl -X GET -H "Content-Type: application/json" -H "$authHeader" $uri


