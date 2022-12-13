# Install & Configure Git Plugin:
Git is one of the most popular tools for version control system. you can pull code from git repositories using jenkins if you use github plugin.


## Prerequisites:

1. Jenkins Server

### Install Git on Jenkins Server:
```
sudo apt install git -y
```

#### Setup Git on jenkins console
- Install git plugin without restart  
  - `Manage Jenkins` > `Jenkins Plugins` > `available` > `github`

- Configure git path
  - `Manage Jenkins` > `Global Tool Configuration` > `git`\


> NOTE: Git is already installed in latest versions


### Create Item to Pull Code from Github:
1. Go to Dashboard
2. Choose `New Item`
3. Enter `<ITEM_NAME>` (Eg: `PullCodeFromGithub`)
4. Choose `Freestyle Project`
5. `Source Code Management` > `Git` 
6. Enter `Respository URL` > Public normal or if choosing Private, provide the credentials such as tokens
7. Specify Branch
8. Click `Apply` & `Save` 
9. CLick `Build Now` to build manually 
