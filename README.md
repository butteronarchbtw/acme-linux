personal port of part of the plan9 ecosystem to unix makefiles

this fork contains just enough for building acme or sam and setting a custom font

mainly for educational purposes (and because building plan9port was too slow for me)

all code is taken from [plan9port](https://github.com/9fans/plan9port), please support them if you are interested

# Building

```sh
./configure acme && make
```

or

```sh
./configure sam && make
```

or

```sh
./configure tools && make
```

both acme and sam need plan9tools to run properly (e.g. to set fonts)

# Installing

the default location is `/usr/local`

```sh
sudo make install
```

you can use the `DESTDIR` and `prefix` variables to choose an install location, e.g. `make DESTDIR=<destdir> prefix=<prefix> install`

# Uninstalling

```sh
sudo make uninstall
```

if you provided `DESTDIR` and/or `prefix` during installation, you have to provide the same values here as well

# Fonts

the default fonts acme uses are not installed, but `fontsrv` is

so just use

```
fontsrv -m <mountpoint> &
```

to mount your fonts where you want them and then execute

```
acme -f <mountpoint>/<fontname>/<fontsize>/font
```

to run acme

# Nix

A flake providing `packages.acme` and `packages.sam` is contained in the project root.

Both with install `packages.plan9tools` as a dependency alongside automatically.

You can, for example, run

```
nix shell github:butteronarchbtw/acme-linux#sam
```

and use the binaries as explained above.
