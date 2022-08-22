# Create a Nomad cluster using Lima

Dependencies

[Lima](https://github.com/lima-vm/lima)

```
brew install lima
```

[vde_vmnet](https://github.com/lima-vm/vde_vmnet)

```
git clone https://github.com/lima-vm/vde_vmnet
cd vde_vmnet

# copy paste sudo command like a badass
sudo make PREFIX=/opt/vde install

limactl sudoers | sudo tee /etc/sudoers.d/lima
```

## Create a cluster

You can change the cluster name prefix by setting the `CLUSTER_NAME` environment
variable.

Two client nodes will be created unless `CLIENT_NODES` is set.

```
./create.sh
```

Stop a cluster

```
./stop.sh
```

Start a cluster

```
./start.sh
```

Delete a cluster

```
./delete.sh
```
