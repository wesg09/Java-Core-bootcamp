import requests
import msal


def request_access_token():
    app_id = '<app id>'
    tenant_id = '<tenant id>'

    authority_url = 'https://login.microsoftonline.com/' + tenant_id
    scopes = ['https://analysis.windows.net/powerbi/api/.default']

    # Step 1. Generate Power BI Access Token
    client = msal.PublicClientApplication(app_id, authority=authority_url)
    token_response = client.acquire_token_by_username_password(username=username, password=password, scopes=scopes)
    if not 'access_token' in token_response:
        raise Exception(token_response['error_description'])

    access_id = token_response.get('access_token')
    return access_id

access_id = request_access_token()
'''
dataset_id = ''
endpoint = f'https://api.powerbi.com/v1.0/myorg/datasets/{dataset_id}/refreshes'
headers = {
    'Authorization': f'Bearer ' + access_id
}

response = requests.post(endpoint, headers=headers)
if response.status_code == 202:
    print('Dataset refreshed')
else
    print(response.reason)
    print(response.json())
'''



# secret  = cx_8Q~m_Aczkz-puWJmu9OjFB.Tl3Y~P5mfwoc5a
# client id = 2b7dadde-2fe8-444d-9f0b-cac02be45964
# tenant id = 4a830549-713a-4c68-bff6-44417964169d