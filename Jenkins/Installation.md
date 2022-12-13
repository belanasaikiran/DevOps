# Jenkins
enkins is a self-contained Java-based program, ready to run out-of-the-box, with packages for Windows, 
Mac OS X and other Unix-like operating systems. As an extensible automation server, 
Jenkins can be used as a simple CI server or turned into the continuous delivery hub for any project.


## Installing on Azure/AWS/GCP:

### Prerequisites
1. EC2 Instance / VM With Internet Access
2. Security Group with Port 8080 open for internet
3. Java 11 should be installed



## Installation for Java 11:
```
sudo apt udpate
sudo apt-get install openjdk-11-jdk
```

## Install Jenkins
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
```
```
sudo apt-get update && sudo apt-get install jenkins -y
```

## Start Jenkins:

### Start jenkins service
```
service jenkins start

# for Status:
service jenkins status
```

# Setup Jenkins to start at boot,
```
sudo systemctl enable jenkins
```


### Accessing Jenkins:
```
http://public-ip:8080
```


### Configuring Jenkins

* The default Username is admin
* Grab the default password
* Password Location: `/var/lib/jenkins/secrets/initialAdminPassword`
* Skip Plugin Installation; We can do it later
* Change admin password
* Admin > Configure > Password
* Configure java path
* Manage Jenkins > Global Tool Configuration > JDK
* Create another admin user id


### Test Jenkins Jobs
1. Create “new item”
2. Enter an item name – `My-First-Project`
   - Chose `Freestyle` project
3. Under the Build section
	Execute shell: echo "Welcome to Jenkins Demo"
4. Save your job 
5. Build job
6. Check "console output"



