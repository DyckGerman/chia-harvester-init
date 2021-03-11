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
if [ $? -eq 0 ]
    then
        echo "|||| chia install.sh ended successfully ||||"
    else
        echo "|||| chia install.sh failed ||||"
        exit 1
fi


. ./activate
if [ $? -eq 0 ]
    then
        echo "|||| switched to chia env ||||"
    else
        echo "|||| failed to switch to chia env ||||"
        exit 1
fi

chia init
if [ $? -eq 0 ]
    then
        echo "|||| chia init ended successfully ||||"
    else
        echo "|||| failed to init chia ||||"
        exit 1
fi
