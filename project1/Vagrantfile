Vagrant.configure("2") do |config|
  
    config.vm.define "lab1" do |lab1|
      lab1.vm.box = "generic/rocky9"
      lab1.vm.hostname = "lab1"
      
      lab1.vm.provider "virtualbox" do |vb|
        vb.name = "lab1-virtualbox"
        vb.memory = "1024"
        vb.cpus = 2

      lab1.vm.network "private_network", ip: "192.168.56.100"

      lab1.vm.provision "shell", inline: <<-SHELL
        # Check if swap file already exists
        if [ ! -f /swapfile ]; then
          sudo fallocate -l 4G /swapfile
          sudo chmod 600 /swapfile
          sudo mkswap /swapfile
        fi

        # Check if swap is already on, if not, turn it on
        if ! swapon -s | grep -q '/swapfile'; then
          sudo swapon /swapfile
        fi

        # Add swap entry to /etc/fstab if not present
        if ! grep -q '/swapfile none swap sw 0 0' /etc/fstab; then
          echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
        fi
      SHELL
    end
  end
end
