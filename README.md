Dockerfile for GHC 7.8.3 on Ubuntu 12.04
========================================

Building:

```
make
```

You can see Makefile for additional options or manual command launch.

Running:

First, pull an image:

```
sudo docker pull kobx/ghc-7.8
```

Then run it:

```
sudo docker run -d -P --name ghc -v /home/username/workspace/myproj:/root/myproj:rw kobx/ghc-7.8
```

Connecting (password is "docker"):

```
➜  docker-ghc-7.8  sudo docker port ghc 22
0.0.0.0:49153
➜  docker-ghc-7.8  ssh root@127.0.0.1 -p 49153
root@127.0.0.1's password: 
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.13.0-24-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Last login: Sat Apr 12 21:15:37 2014 from 172.17.42.1
root@e7bee61ffb12:~# ghci
GHCi, version 7.8.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
```

Another method is connecting via [nsenter](https://github.com/jpetazzo/nsenter).

Stopping / removing running image:

```
sudo docker stop ghc
sudo docker rm ghc
```
