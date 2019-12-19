# DNSCrypt Proxy 2 for Android via Magisk
The project aims to bring DNSCrypt-Proxyv2 to Android via [Magisk module](https://www.xda-developers.com/how-to-install-magisk/).

## Table of Contents
 * [What is DNSCrypt-Proxyv2 and why do I need it?!](#what-is-dnscrypt-proxyv2-and-why-do-i-need-it--)
 * [DNSCrypt Features](#dnscrypt-features)
 * [Why aren't older Android versions supported?](#why-aren-t-older-android-versions-supported-)
 * [Donations](#donations)
 * [Pre-built binaries](#pre-built-binaries)
 * [Differences between the old DNSCrypt Proxy Magisk project](#differences-between-the-old-dnscrypt-proxy-magisk-project)
       * [dnscrypt-proxy.toml configurations file](#dnscrypt-proxytoml-configurations-file)
 * [Installation](#installation)
   + [AFWall+ enforce a specific DNS server](#afwall+-enforce-a-specific-dns-server)
   + [Configuration (post-installing)](#configuration--post-installing-)
 * [Changelog](#changelog)
 * [Debug problems](#debug-problems)
 * [Credits](#credits)


## What is DNSCrypt-Proxyv2 and why do I need it?!
DNSCrypt-Proxyv2 is a flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## DNSCrypt Features
- [Please check the official page](https://github.com/DNSCrypt/dnscrypt-proxy#features) to see what DNSCrypt-Proxyv2 has to offer.
- The project related DNSCrypt-Proxyv2 binaries are taken from the [official release page](https://github.com/jedisct1/dnscrypt-proxy/releases).


## Why aren't older Android versions supported?
Magisk itself does not support all (old) Android versions, and I also believe that due to security and privacy reasons older Android versions should not be used anymore. However, you still can use and flash the module, but there will be no support from my side, there will be no support given for older Android versions!


## Donations
**I do not accept donations** for this project, if you want to support someone, please [donate to the original DNSCrypt-Proxyv2 project](https://github.com/DNSCrypt/dnscrypt-proxy). This helps to keep DNSCrypt-Proxyv2 alive and pushes the project.


## Pre-built binaries
Up-2-date, [pre-built binaries](https://github.com/CHEF-KOCH/dnscrypt-proxy-android/tree/master/binary) are available for the following platforms:
- `ARM`
- `ARM64`
- `x86`
- `x86_64`


## Differences between the old DNSCrypt Proxy Magisk project
I dislike that other Magisk Android modules are hosted on Telegram, so I opened this project. It's beyond me why the magisk version is been hosted via [GitTea](https://git.nixnet.xyz/quindecim/dnscrypt-proxy-android) because the original code is hosted on GitHub and so should any other DNSCrypt-proxy related project (_my point of view_).


##### dnscrypt-proxy.toml configurations file
- ✅ `DNSSEC` is required
- ✅ `dnscrypt_ephemeral_keys` feature is enabled (_create a new, unique key for every single DNS query_)
- ✅ `anonymized_dns` is enabled (_each resolver has 2 relay_)
- ✅ `IPv6` is enabled, see [here](https://www.ripe.net/publications/news/about-ripe-ncc-and-ripe/the-ripe-ncc-has-run-out-of-ipv4-addresses) why
- ⛔️ `DoH` is disabled, due to [privacy concerns](https://github.com/CHEF-KOCH/FFCK/issues/7)
- ℹ️ `refused` is been set to respond to blocked queries
- ℹ️ The DNS query max. response time was changed from `5000` to `4500` ms.
- ℹ️ [CleanBrowsing](https://cleanbrowsing.org/) is been set as fallback resolver 
- ℹ️ The configuration uses `dnscrypt.nl-ns0` (NL), `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnswarden-dc1` (DE), `dnswarden-dc1` (DE), `ffmuc.net` (DE), `ibksturm` (CH), `publicarray-au` (AUS), `publicarray-au2` (AUS), `scaleway-ams` (NL), `scaleway-fr` (FR) and `v.dnscrypt.uk-ipv4` (UK)


## Installation
![This is how you pack a release](https://user-images.githubusercontent.com/727123/71154349-3c62b600-2233-11ea-878d-5d3a3decfdf0.png "Logo Title Text 1")


1. Download latest `.zip` file from  the [release channel](https://github.com/CHEF-KOCH/dnscrypt-proxy-android/releases), now repack it with the module files in the root of the zip rather then the directory.
2. Flash the module via Magisk Manager (_the big plus + button_) and wait until the flash process is done.
2. Reboot your device afterwards.
3. That's it! Optionally you could change the `dnscrypt-proxy.toml` as per own needs.


### AFWall+ enforce a specific DNS server
This is optional and in case you like to enforce a specific DNS server via [AFWall+](https://github.com/ukanth/afwall). You can add this via [custom script](https://github.com/ukanth/afwall/wiki/CustomScripts), this example uses [CleanBrowsing](https://en.wikipedia.org/wiki/CleanBrowsing) as DNS server.

**Warning**:
Make sure the script uses [LF](https://stackoverflow.com/questions/1552749/difference-between-cr-lf-lf-and-cr-line-break-types) as line ending! And that you give AFWall+ the correct path to your script e.g. `. /data/local/shartupscript.sh` (_the space between . and / is mandatory!_).

**Startup script:**
```
iptables -t nat -A OUTPUT -p tcp ! -d 185.228.168.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -A OUTPUT -p udp ! -d 185.228.168.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
ip6tables -t nat -A OUTPUT -p tcp ! -d 2a0d:2a00:1::2 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -A OUTPUT -p udp ! -d 2a0d:2a00:1::2 --dport 53 -j DNAT --to-destination [::1]:5354
```
   
**Shutdown script:**
```
iptables -t nat -D OUTPUT -p tcp ! -d 185.228.168.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -D OUTPUT -p udp ! -d 185.228.168.9 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
ip6tables -t nat -D OUTPUT -p tcp ! -d 2a0d:2a00:1::2 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -D OUTPUT -p udp ! -d 2a0d:2a00:1::2 --dport 53 -j DNAT --to-destination [::1]:5354
```

### Configuration (post-installing)

- You can manually edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` or `/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml` to change DNSCryp-Proxyv2 settings.
- For more in-depth explanation please check the [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration).


## Changelog

You can see the full changelog [here](changelog.md).


## Debug problems

Check (via [terminal](https://www.techrepublic.com/article/how-to-get-a-linux-terminal-on-android/)/[termux](https://f-droid.org/en/packages/com.termux/)) if DNSCrypt is working (active) `su dnscrypt-proxy --check`

```bash
su
ps -A | grep dnscrypt-proxy
```


## Credits
- [jedisct1](https://github.com/jedisct1/dnscrypt-proxy) for his DNSCrypt-Proxy2 project
- [topjohnwu](https://github.com/topjohnwu) for his Magisk project
- [bluemeda](https://github.com/bluemeda) for the original magisk module
- [adit](https://github.com/adit) for his dcp 
- [All contributors](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors) and authors from the old dnscrypt-module
- [All contributors as well as authors](https://git.nixnet.xyz/quindecim/dnscrypt-proxy-android) from the Gittea project
