echo "PREREQUISITES:"
if [ -f /etc/fedora-release ]; then
    echo "Running prerequisites for FEDORA"
    sudo dnf install ansible
else
    echo "ERROR: Script does not support OS or distribution!"
fi

echo
echo "Staring configuration"
ansible-pull -U https://github.com/ktutils/kt -d $HOME/.setup -K ansible/local.yml