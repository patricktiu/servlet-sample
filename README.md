# Database Sample

## Project Directory Structure
```
.
|____Dockerfile
|____manifest
| |____deployment.yaml
| |____service.yaml
| |____route.yaml
|____README.md
|____pipeline.yaml
|____assets
| |____app
| | |____DB2App-1_war.ear
| |____config
| | |____install_app.py
| | |____DB2App-1_war.ear_DB2App-1_war.ear_wsadmin.py
| |____lib
| | |____.keep
| | |____db2jcc4.jar
```

## Building the application image
Dockerfile adds three things to build application image
1. application EAR file
2. application installation script (Jython)
3. Daserver configuration scripot (Jython)

## Test locally 
- make sute the db2 container is running in host 9.21.109.27
- docker build . -t twas-server
- docker run --name appserver90 --detach -p 9043:9043 -p 9443:9443  twas-server
- open https://localhost:9443/db2/hello
- open https://localhost:9443/db2/db
- open https://localhost:9043/ibm/console 
- docker exec  appserver90 cat /tmp/passwordupdated
- docker stop appserver90

## Create a custom Tekton pipeline to build and deploy the application image

*Note: make sure you have Openshift pipeline operator v0.8.2 or higher.  ICP4A 4.0.0 installation comes with v0.7.0 only*

1. Login to your OCP cluster
   ```
   oc login URI --token=TOKEN (from Copy Login Command in OCP console)
   ```

2. Create a new project
   ```
   oc new-project servlet-sample
   ```

3. Create pipeline build tasks and resources
   ```
   oc create -f pipeline.yaml
   ```

4. Start the pipeline (or use the Tekton dashboard)
   ```
   tkn pipeline start build-and-deploy
   ```

10. Congratulations! You've successfully deployed your tWAS application to OCP 4.x.

