sudo apt-get update
sudo apt-get upgrade -y

if [ $? -eq 0 ]
    then
        echo "|||| packages updated ||||"
    else
        echo "|||| error while updating packages ||||"
        exit 1
fi

# Checkout the source and install
git clone https://github.com/Chia-Network/chia-blockchain.git

if [ $? -eq 0 ]
    then
        echo "|||| chia repo cloned ||||"
    else
        echo "|||| chia repo clone failed ||||"
        exit 1
fi

cd chia-blockchain

sh install.sh

. ./activate

chia init
