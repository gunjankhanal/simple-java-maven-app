#!/bin/bash
git config user.email "thisisgunjan@yahoo.com"
git config user.name "gunjankhanal"

sed -i "s/goonz\/azure_push:.*/goonz\/azure_push:${BUILD_ID}/" deploymentmanifest/deployment.yaml
git add deploymentmanifest/deployment.yaml
git commit -m "Update deployment image to version ${BUILD_ID}"

git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master


current_version=${BUILD_ID}
# Increment the version
new_version=$((current_version + 1))

# Write the new version back to the file
echo $new_version > BUILD_ID

# Display the new version
echo "New version: $new_version"
BUILD_ID=${BUILD_ID}+1
