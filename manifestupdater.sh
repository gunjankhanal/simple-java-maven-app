#!/bin/bash
git config user.email "thisisgunjan@yahoo.com"
git config user.name "gunjankhanal"
${BuildID}
# {BuildId}=${BuildId}
sed -i "s/replaceImageTag/${BuildId}/g" deploymentmanifest/deployment.yaml
git add deploymentmanifest/deployment.yaml
git commit -m "Update deployment image to version ${BuildId}"
git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master
