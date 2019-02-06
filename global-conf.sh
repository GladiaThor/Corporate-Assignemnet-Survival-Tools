!#/bin/bash
echo full name
read name
echo email
read mail
git config --global user.name "$name"
git config --global user.email "$mail"
git config --global core.filemode false
git config --global core.whitespace cr-at-eol

echo proxy address Leave blank if none
read proxy
if [ -z "$proxy" ]; then
        git config --global http.proxy $proxy
        npm config set proxy $proxy
        npm config set https-proxy $proxy
fi

echo ssh-key passphrase
read pass
echo username on this WINDOWS PC
read uname

ssh-keygen -t rsa -C $mail -N $pass -f "C:/Users/$uname/.ssh/id_rsa"


echo ssh-key generated at: "C:/Users/$uname/.ssh/id_rsa"
clip < C:/Users/$uname/.ssh/id_rsa.pub
