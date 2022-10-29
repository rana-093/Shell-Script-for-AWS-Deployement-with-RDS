#Generate ssh-key for bitbucket
ssh-keygen

#install essentials
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

#python verison with pyenv
curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
exec $SHELL
pyenv install -v 3.6.9 #Change specific python version


#To resolve gcc errors
sudo apt-get install build-essential

#postgres installation
sudo apt update && sudo apt upgrade
sudo apt -y install gnupg2 wget vim
sudo apt-cache search postgresql | grep postgresql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt -y update
sudo apt -y install postgresql-14


#connect to postgres
psql -h {hostName} -p 5432 -U postgres -W
#Then enter the password of rds


#Postgres create Role & Others
create role money_user CREATEDB LOGIN PASSWORD 'your_password';
create database money_db;
alter database money_db OWNER TO money_user;
grant all privileges on database money_db to money_user;

#\c money_db 
#Need rds password in this stage; You can modidy rds password by this
ALTER USER postgres WITH PASSWORD 'postgres'


#install pip
sudo apt install python-pip
sudo pip install virtualenv
virtualenv --python python3 venv
source venv/bin/activate

#To avoid distutils error
sudo apt-get install --reinstall python3.6-distutils #With respective python version

#Nginx install
sudo apt update
sudo apt install nginx

#installing NVM
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile 

#installing NPM
nvm install latest / (specific version of node)

#installing pm2
npm install pm2 -g && pm2 update

#S3 Policies to allow access to CloudFront
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::upworkdummy"
        },
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::upworkdummy/*"
        }
    ]
}
