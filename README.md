# dotfiles: `macos-base`

dotfiles and setup script for macOS.

## Installing

```bash
git clone https://github.com/timokluser-dev/dotfiles.git
git checkout macos-base

chmod +x *.sh

# start install
./bootstrap.sh
```

> :information_source: Depening on the terminal you are using, you have to set the font to `Fira Code`. 

---

## Adjustments to the Script

### Brew

1. search package online: [https://formulae.brew.sh/formula](https://formulae.brew.sh/formula/)
2. check **Formula code on GitHub**
    - see if is provided: `sha256`
    - see if official download servers are used: `url`
3. if no security concerns: add to `bootstrap.sh` and create PR
