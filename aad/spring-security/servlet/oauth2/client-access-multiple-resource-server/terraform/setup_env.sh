RESOURCE_SERVER_1_CLIENT_ID=$(terraform -chdir=./terraform output -raw RESOURCE_SERVER_1_CLIENT_ID)
RESOURCE_SERVER_2_CLIENT_ID=$(terraform -chdir=./terraform output -raw RESOURCE_SERVER_2_CLIENT_ID)

# set identifier_uris
echo "----------update identifier-uris for RESOURCE_SERVER_1----------"
az ad app update --id $RESOURCE_SERVER_1_CLIENT_ID --identifier-uris api://$RESOURCE_SERVER_1_CLIENT_ID

echo "----------update identifier-uris for RESOURCE_SERVER_2----------"
az ad app update --id $RESOURCE_SERVER_2_CLIENT_ID --identifier-uris api://$RESOURCE_SERVER_2_CLIENT_ID

echo "----------update identifier-uris completed----------"

export TENANT_ID=$(terraform -chdir=./terraform output -raw TENANT_ID)
export CLIENT_1_CLIENT_ID=$(terraform -chdir=./terraform output -raw CLIENT_1_CLIENT_ID)
export RESOURCE_SERVER_1_CLIENT_ID=$(terraform -chdir=./terraform output -raw RESOURCE_SERVER_1_CLIENT_ID)
export RESOURCE_SERVER_2_CLIENT_ID=$(terraform -chdir=./terraform output -raw RESOURCE_SERVER_2_CLIENT_ID)
export CLIENT_1_CLIENT_SECRET=$(terraform -chdir=./terraform output -raw CLIENT_1_CLIENT_SECRET)
export RESOURCE_SERVER_1_CLIENT_SECRET=$(terraform -chdir=./terraform output -raw RESOURCE_SERVER_1_CLIENT_SECRET)
export USER_NAME=$(terraform -chdir=./terraform output -raw USER_NAME)
export USER_PASSWORD=$(terraform -chdir=./terraform output -raw USER_PASSWORD)

echo TENANT_ID=$TENANT_ID
echo CLIENT_1_CLIENT_ID=$CLIENT_1_CLIENT_ID
echo RESOURCE_SERVER_1_CLIENT_ID=$RESOURCE_SERVER_1_CLIENT_ID
echo RESOURCE_SERVER_2_CLIENT_ID=$RESOURCE_SERVER_2_CLIENT_ID
echo CLIENT_1_CLIENT_SECRET=$CLIENT_1_CLIENT_SECRET
echo RESOURCE_SERVER_1_CLIENT_SECRET=$RESOURCE_SERVER_1_CLIENT_SECRET

echo "--------created user--------"
echo USER_NAME=$USER_NAME
echo USER_PASSWORD=$USER_PASSWORD

