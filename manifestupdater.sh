#!/bin/bash
git config user.email "thisisgunjan@yahoo.com"
git config user.name "gunjankhanal"
Build.BuildId=${Build.BuildId}
sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" deploymentmanifest/deployment.yaml
git add deploymentmanifest/deployment.yaml
git commit -m "Update deployment image to version ${BUILD_NUMBER}"
git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
