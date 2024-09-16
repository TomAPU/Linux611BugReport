# Linux611BugReort
Config and everything about Linux 6.11-rc7 bug report

## Kernel config
[.config file](kernelconfig)

## Pre-compiled kernel
We have our vmlinux and bzImage uploaded to [Mega](https://mega.nz/folder/m6xxAAbB#h1QgTIsESOOwLOzD1vkHYw)

## Compile the kernel through docker
```bash
git clone https://github.com/TomAPU/Linux611BugReport.git
cd ./Linux611BugReport
docker build -t linux611-builder-docker .
docker run -it -v /path/on/host:/output linux611-builder-docker
```

## Boot with QEMU 
```
qemu-system-x86_64 -m 4096 -smp 1 -chardev socket,id=SOCKSYZ,server=on,wait=off,host=localhost,port=57307 -mon chardev=SOCKSYZ,mode=control -display none -serial stdio -no-reboot -name VM-1 -device virtio-rng-pci -enable-kvm -cpu host,migratable=off -device e1000,netdev=net0 -netdev user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:16834-:22 -hda <path/to/disk/image> -snapshot -kernel <path/to/bzImage> -append "root=/dev/sda console=ttyS0"
```
## Software versions

| software  | what we used for | version|
| ------------- | ------------- |------------- |
| Clang  | 14.0.0  x86_64-pc-linux-gnu| Compile the kernel|
| QEMU  | 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.22)  |Boot up the kernel|
| Linux kernel|[6.11-rc7](https://github.com/torvalds/linux/archive/refs/tags/v6.11-rc7.tar.gz) | The kernel |
