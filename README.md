# Servlet 3.0 Sample

A WebSphere Application Server V8.5 sample demonstrates some Servlet 3.0 functionality and
a basic pattern for deploying an application into Red Hat OpenShift with IBM Cloud Pack for Application.

*Note:*
*For IBM Cloud Pack for Application v4.0.0, we need to openship-pipeline-operator:0.8.0*

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
| | |____WebcontainerSample.ear
| |____config
| | |____was-config.props
| | |____install_app.py
| |____lib
| | |____.keep
```

## Building the application image
Dockerfile adds three things to build application image
1. application EAR file
2. application installation script (Jython)
3. sample properties file that increases container thread pool to 100

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

