#!/bin/bash
git config user.email "thisisgunjan@yahoo.com"
git config user.name "gunjankhanal"

# Build.BuildNumber=$(Build.BuildNumber)
# Build.BuildId=$(Build.BuildId)
# {BuildId}=${BuildId}

sed -i "s/replaceImageTag/${BUILD_ID}/g" deploymentmanifest/deployment.yaml
git add deploymentmanifest/deployment.yaml
git commit -m "Update deployment image to version ${BUILD_ID}"
git commit -m "Update deployment image to version $(BUILD_ID)"
git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master
