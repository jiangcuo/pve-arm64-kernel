## pve-port-kernel for phytium

### How to build
copy phytium kernel(contain patches) in {src}/linux
exec `bash autobuild.sh`

### Update Version

- 1. Change "Maintainer" in debian/control
- 2. exec `bash scripts/update.sh`
- 3. Add more changes in debian/changelog,`nano debian/changelog`

### Add patches

- 1. Create dir `debian/patches/phytium`
- 2. Copy the patches to `debian/patches/phytium`
- 3. Write the patches list to `debian/patches/series.linux`
    ```bash
    for i in `ls debian/patches/phytium`;
        do echo phytium/$i >> debian/patches/series.linux;
    done
    ```
