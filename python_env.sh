wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
xz -d Python-3.6.3.tar.xz
tar -xvf Python-3.6.3.tar
rm Python-3.6.3.tar
cd Python-3.6.3/
make
sudo make install
./configure --with-ssl
make
sudo make install
pip3 install --upgrade pip
