echo '==> Setting time zone'

timedatectl set-timezone $TIMEZONE
cat /etc/timezone

echo '==> Installing Linux tools'
apt-get -q=2 install software-properties-common bash-completion curl tree zip unzip pv whois > /dev/null 2>&1

echo '==> Installing Git'
apt-get -q=2 install git git-man > /dev/null 2>&1

echo '==> Installing Python3'
apt-get -q=2 install python3 libpq-dev python-dev > /dev/null 2>&1
apt-get -q=2 update

echo '==> Installing pip for Python3'
apt-get -q=2 install python3-pip > /dev/null 2>&1
apt-get -q=2 update

echo '==> Install psycopg2, Django'
pip3 install psycopg2 Django

echo '==> Cleaning apt cache'
apt-get -q=2 autoclean
apt-get -q=2 autoremove
apt-get -q=2 clean

echo '==> Versions:'

lsb_release -d
echo $(git --version)
echo $(python3 --version)
echo "Django: "$(python3 -c "import django; print(django.get_version())")
echo "psycopg2: "$(python3 -c "import psycopg2; print(psycopg2.__version__)")
