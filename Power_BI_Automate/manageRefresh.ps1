
$groupID = "43f6b5ed-cb86-4cdc-abef-f0d205e9fca7" # the ID of the group that hosts the dataset. Use "me" if this is your My Workspace
$datasetID = "0e074d27-adcd-4290-a08e-4aa375e51801" # the ID of the dataset that hosts the dataset

$clientId = "b759774c-6f25-4860-a0cf-7fc4b9a8dc24" 


function GetAuthToken
{
       if(-not (Get-Module AzureRm.Profile)) {
         Import-Module AzureRm.Profile
       }
 
       $redirectUri = "urn:ietf:wg:oauth:2.0:oob"
 
       $resourceAppIdURI = "https://analysis.windows.net/powerbi/api"
 
       $authority = "https://login.microsoftonline.com/common/oauth2/authorize";
 
       $authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
 
       $authResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, "Auto")
 
       return $authResult
}
$token = GetAuthToken

# Building Rest API header with authorization token
$authHeader = @{
   'Content-Type'='application/json'
   'Authorization'=$token.CreateAuthorizationHeader()
}

# properly format groups path
$groupsPath = ""
if ($groupID -eq "me") {
    $groupsPath = "myorg"
} else {
    $groupsPath = "myorg/groups/$groupID"
}

'''
# Refresh the dataset
$uri = "https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
Invoke-RestMethod -Uri $uri –Headers $authHeader –Method POST –Verbose

# Check the refresh history
$uri = "https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
Invoke-RestMethod -Uri $uri –Headers $authHeader –Method GET –Verbose
'''
# Refresh the dataset
$uri = "https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
Invoke-RestMethod -Uri $uri -Headers $authHeader -Method POST -ContentType "application/json" -Verbose

# Check the refresh history
$uri = "https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
$refreshHistory = Invoke-RestMethod -Uri $uri -Headers $authHeader -Method GET -Verbose

$refreshHistory | Format-Table