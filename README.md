# Proxmox Port kernels
Custom Linux kernels for Proxmox VE loongarch64 4k page-table

Support zfs-2.2.2.

Proxmox-backup-server need 4k page kernel .So  we recommend use this branch if you want run proxmox-backup-server.


### Manual
Alternatively, you may manually install the kernels. Select from the [Releases](https://github.com/fabianishere/pve-edge-kernel/releases)
page the kernel version you want to install and download the appropriate Debian package.
Then, you can install the package as follows:

```sh
apt install ./pve-kernel-VERSION_amd64.deb
```

## Building manually
You may also choose to manually build one of these kernels yourself.

#### Prerequisites
Make sure you have at least 10 GB of free space available and have the following
packages installed:

```bash
apt install devscripts debhelper equivs git
```

#### Obtaining the source
Obtain the source code as follows:
```bash
git https://github.com/jiangcuo/pve-port-kernel
cd pve-port-kernel
```
Then, select the branch of your likings (e.g. `v6.1`) and update the submodules:
```bash
git checkout loong64
git submodule update --init --depth=1 --recursive linux
git submodule update --init --recursive
```

#### Building
First, generate the Debian control file for your kernel by running the following
in your command prompt:
```bash
debian/rules debian/control
```
Before we build, make sure you have installed the build dependencies:
```bash
sudo mk-build-deps -i
```
merge your confile,if your kernel config is `/boot/config-5.10.167-edge`,do
```bash
cat /boot/config-5.10.167-edge >> debian/config/config.pve
```
Invoking the following command will build the kernel and its associated packages:
```bash
debuild -ePVE* --jobs=auto -b -uc -us
```
The Makefile provides several environmental variables to control:

1. `PVE_KERNEL_CC`  
   The compiler to use for the kernel build.
2. `PVE_KERNEL_CFLAGS`  
   The compilation options to use for the kernel build. Use this variable to specify
   the optimization level or micro architecture to build for.

Kernel options may be controlled from [debian/config/config.pve](debian/config/config.pve). To build with
additional patches, you may add them to the [debian/patches/pve](debian/patches/pve) directory
and update the [series](debian/patches/series.linux) file accordingly.

## Removal
Use `apt` to remove individual kernel packages from your system. If you want
to remove all packages from a particular kernel release, use the following
command:

```bash
apt remove pve-kernel-6.1* pve-headers-6.1*
```

## Contributing
Questions, suggestions and contributions are welcome and appreciated!
You can contribute in various meaningful ways:

* Report a bug through [Github issues](https://github.com/jiangcuo/pve-port-kernel/issues).
* Propose new patches and flavors for the project.
* Contribute improvements to the documentation.
* Provide feedback about how we can improve the project.
