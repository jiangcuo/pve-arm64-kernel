# Proxmox Edge kernels
Custom Linux kernels for Proxmox VE arm64

#### Available Versions
1. Linux 6.2 ->branch:v6.2
2. Linux 6.1 -> master
3. Linux 5.15 -> branch:v5.15

## Installation
add arm64 kernel repo.

```sh
echo "deb https://mirrors.apqa.cn/proxmox/debian/kernel sid port" > /etc/apt/sources.list.d/pve-arm64-kernel.list
apt update
apt search pve-kernel
apt install pve-kernel-xxxx
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
git https://github.com/jiangcuo/pve-arm64-kernel
cd pve-arm64-kernel
```
Then, select the branch of your likings (e.g. `v6.1`) and update the submodules:
```bash
git checkout master
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

* Report a bug through [Github issues](https://github.com/jiangcuo/pve-arm64-kernel/issues).
* Propose new patches and flavors for the project.
* Contribute improvements to the documentation.
* Provide feedback about how we can improve the project.
