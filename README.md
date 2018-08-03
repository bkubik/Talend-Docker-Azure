# Talend Dockerfile - Azure

This repository include a bash Dockerfile script which allows you to deploy automated Talend jobs to an Azure Container Registry on new commits.

# How To Use

### Work Flow
1. Create a fork of this Repository.
2. Edit the Dockerfile Variables.
3. Run the Azure build-task command to link the repo to the repository.
4. Upload the Talend Job File.

### Instructions

**Step 1:** Fork this Repository. Forking is a way for you to clone this repository, and to modify it from there (Upload your Job). To fork is just another way of saying clone. From this repository, click Fork on the top right and it will fork this repository to your account. 

**Step 2:** We will now need to prep the Dockerfile for the build-task. We will need to edit 2 variables in the Dockerfile; 1 extra which is optional for context_params.

Included in this repo is a test file called Test_0.1.zip (The JOB_NAME is Test) This Talend Job will print Hello-World. You can use this file to test this solution.

FILE_NAME will be the name of the zip file. For example if your zipfile is called Test_0.1.zip then this will be the filename. 

    ENV FILE_NAME="Test_0.1.zip"
    
JOB_NAME will be the Job Name you specified in the Talend Job when you created it. We set it to Test in our example.
    
    ENV JOB_NAME="Test"
    
CONTEXTARGS allows us to pass any additional context_params to the Talend Job. This is optional. If you dont not have any just leave it as is. Otherwise you can enter something like `--context_param VAR1=VAR1`
    
    ENV CONTEXTARGS=""

**Step 3:** Once forked you will want to link the Azure Task to the Github as follows. This will allow us to deploy automated Talend jobs to an Azure Container Registry on new commits. You will replace the following fields: `(REGISTRY-NAME, JOB-NAME, IMAGE-NAME, FORKED-GITHUB-REPO-URL, GITHUB-USER-TOKEN)` To get a Github-User-Token visit: [How Creating a personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

    $ az acr build-task create --registry REGISTRY-NAME --name JOB-NAME --image IMAGE-NAME:v1 --context FORKED-GITHUB-URL --branch master --git-access-token GITHUB-USER-TOKEN
    
**Step 4:** Using the Github Web UI you can upload your Talend_Job.zip file. Simply click Upload Files on the repo page and click Commit Changes when done. For more instructions on how to upload files to a repo please visit: [Adding a file to a repository
](https://help.github.com/articles/adding-a-file-to-a-repository/)

Everytime we upload a new file or make a change it will run the build-task and upload the latest build to the Azure Registry assuming build is successful. So if you wish to upload a new build to the registry, simply add a new file or make a change to the Dockerfile.


For S3ReadToSnowflakeWrite task The FILE_NAME = S3ReadToSnowflakeWrite.zip JOB_NAME = S3ReadToSnowflakeWrite
