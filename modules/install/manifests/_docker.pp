#install docker
#https://download.docker.com/linux/
# puppet module install puppetlabs/docker (apt, stdlib, translate)




# Steps to Install Docker on Linux ( RHEL and Centos).
#1. Firstly install device mapper that gives us ability to use different types of storage sub-systems for containers and also lvm2.
#yum install -y yum-utils device-mapper-persistent lvm2
#2.  Add official docker repository using below command:
#yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#Note: This will add community edition repo in case you want to install enterprise edition change ce to ee in the above command.
#3. Perform the yum update using below command.
#yum update
#4. Finally install docker ce using below command:
#yum install docker-ce
#5. Now enable and start the docker using below command:
# systemctl enable docker && systemctl start docker
6. If you would like to use Docker as a non-root user(manmohan user in my case), you should now consider
adding your user to the “docker” group with something like this so that normal user can able to run docker commands:
# usermod -aG docker manmohan

# Steps to Install Docker on Linux ( Ubuntu and Debian).
#1. Install packages to allow apt to use a repository over HTTPS:
#apt-get install apt-transport-https ca-certificates curl software-properties-common
#2. Pull Docker’s official GPG key:
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#3. Use the following command to set up the stable repository.
#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#4. Update the apt package index.
#apt-get update
#5. Install the latest version of Docker CE using below command:
#apt-get install docker-ce
#6. If you would like to use Docker as a non-root user(manmohan user in my case), you should now consider
adding your user to the “docker” group with something like this so that normal user can able to run docker commands:
# usermod -aG docker manmohan
