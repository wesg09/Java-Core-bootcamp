#!/bin/bash
 
#Azure Active Directory and Power Bi authentication
CLIENT_ID="b759774c-6f25-4860-a0cf-7fc4b9a8dc24"
CLIENT_SECRET="cx_8Q~m_Aczkz-puWJmu9OjFB.Tl3Y~P5mfwoc5a"
TENANT_ID="4a830549-713a-4c68-bff6-44417964169d"
DATASET_ID="0e074d27-adcd-4290-a08e-4aa375e51801"
GROUP_ID="43f6b5ed-cb86-4cdc-abef-f0d205e9fca7"

'''
AUTH_URL="https://login.microsoftonline.com/$TENANT_ID/oauth2/v2.0/token"
CODE=$(curl -s -X POST -d "grant_type=client_credentials&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&resource=https://analysis.windows.net/powerbi/api" $AUTH_URL)
ACCESS_TOKEN=$(echo $CODE | jq -r '.access_token')

'''

AUTH_URL="https://login.microsoftonline.com/$TENANT_ID/oauth2/v2.0/token"
CODE=$(curl -s -X POST -d "grant_type=client_credentials&client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&scope=https://graph.microsoft.com/.default" $AUTH_URL)
ACCESS_TOKEN=$(echo $CODE | jq -r '.access_token')

#Send refresh request to Power BI API
REFRESH_URL="https://api.powerbi.com/v1.0/myorg/groups/$GROUP_ID/datasets/$DATASET_ID/refreshes"
curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -d {} $REFRESH_URL

#Check for successful response
if [[ $? -eq 0 ]]; then
  echo "Dataset refresh request sent successfully."
else
  echo "Error: Refresh request failed. Check error code: $?"
fi