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

the necessary missing plan9 tools will be automatically installed alongside

for some scenarios, however, it might be benefitial to *always* install the plan9 tools even if they already exist.
for that case, `./configure (acme|sam) tools` can be run

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

# Gentoo

here is an example ebuild i use on gentoo to install acme system-wide

```ebuild
EAPI=8

DESCRIPTION="Welcome to acme, the editor/shell/window system hybrid."
HOMEPAGE="http://acme.cat-v.org/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

inherit git-r3 multiprocessing

EGIT_REPO_URI="https://github.com/butteronarchbtw/acme-linux.git"

src_configure() {
	./configure acme
}

src_compile() {
	emake
}

src_install() {
	emake prefix="/usr" DESTDIR="${D}" install
}
```

# Nix

A flake providing `packages.acme` and `packages.sam` is contained in the project root.

You can, for example, run

```
nix shell github:butteronarchbtw/acme-linux#sam
```

and use the binaries as explained above.
