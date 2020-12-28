#DEVOPS CHALLENGE CAPGEMINI
#TEAM : LOS ANEMOI

#Installation of Postgres and PGAdmin
docker pull postgres
docker pull dpage/pgadmin4
docker network create --driver bridge pgnetwork
docker run --name POSTGRES -e PG_MODE=primary -e PG_PRIMARY_USER=postgres -e PG_PRIMARY_PASSWORD=datalake -e PG_ROOT_PASSWORD=datalake --hostname="postgres" --network="pgnetwork" -p 5432:5432 -d postgres
docker run --name PGADMIN4 -p 5431:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' --hostname="pgadmin4" --network="pgnetwork" -d dpage/pgadmin4
#Launch in browser : http://localhost:5431/, with user/pass : user@domain.com/SuperSecret
#Connect new serveur with host=postgres user=posgres password=datalake 


#Installation of Jenkins
$JENKINS_NAME="JENKINS"
docker pull jenkins/jenkins
docker run --detach --privileged -p 8080:8080 --name=$JENKINS_NAME jenkins/jenkins
##Get the Jenkins password to access UI
##TODO initialize the password, calling http://localhost:8080/loginError via WS??
$JENKINS_ADMIN_PASS = docker exec $JENKINS_NAME cat /var/jenkins_home/secrets/initialAdminPassword
#Configure Jenkins plugin
##Download Jenkins CLI
(New-Object System.Net.WebClient).DownloadFile('http://localhost:8080/jnlpJars/jenkins-cli.jar','./jenkins-cli.jar')
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth admin:$JENKINS_ADMIN_PASS install-plugin pipeline-utility-steps antisamy-markup-formatter Office-365-Connector ace-editor ant apache-httpcomponents-client-4-api authentication-tokens blueocean-autofavorite blueocean-bitbucket-pipeline blueocean-commons blueocean-config blueocean-core-js blueocean-display-url blueocean-events blueocean-git-pipeline blueocean-github-pipeline blueocean-i18n blueocean-jira blueocean-jwt blueocean-personalization blueocean-pipeline-api-impl blueocean-pipeline-editor blueocean-pipeline-scm-api blueocean-rest-impl blueocean-rest blueocean-web blueocean bouncycastle-api branch-api build-env-propagator build-timeout cloudbees-bitbucket-branch-source cloudbees-folder command-launcher config-file-provider credentials-binding credentials custom-tools-plugin deploy disk-usage display-url-api docker-commons docker-java-api docker-plugin docker-workflow durable-task email-ext envinject-api envinject extended-choice-parameter external-monitor-job favorite gerrit-trigger ghprb git-client git-server git github-api github-branch-source github-pullrequest github gradle handlebars handy-uri-templates-2-api htmlpublisher icon-shim jackson2-api javadoc jenkins-design-language jira jquery-detached jquery-ui jquery jsch junit ldap lockable-resources mailer mapdb-api matrix-auth matrix-project maven-plugin mercurial momentjs multiple-scms nodejs pam-auth pipeline-build-step pipeline-github pipeline-githubnotify-step pipeline-graph-analysis pipeline-input-step pipeline-maven pipeline-milestone-step pipeline-model-api pipeline-model-declarative-agent pipeline-model-definition pipeline-model-extensions pipeline-rest-api pipeline-stage-step pipeline-stage-tags-metadata pipeline-stage-view plain-credentials pom2config publish-over-ssh publish-over pubsub-light purge-job-history resource-disposer reverse-proxy-auth-plugin scm-api selenium seleniumrc-plugin sonar sse-gateway ssh-agent ssh-credentials ssh-slaves structs subversion swarm terminal timestamper token-macro variant vncrecorder windows-slaves workflow-aggregator workflow-api workflow-basic-steps workflow-cps-global-lib workflow-cps workflow-durable-task-step workflow-job workflow-multibranch workflow-scm-step workflow-step-api workflow-support ws-cleanup xvnc blueocean-dashboard script-security http_request
java -jar jenkins-cli.jar -s http://localhost:8080/ -auth admin:$JENKINS_ADMIN_PASS restart

