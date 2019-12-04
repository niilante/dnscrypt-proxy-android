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
   + [Configuration (post-installing)](#configuration--post-installing-)
 * [Changelog](#changelog)
 * [Credits](#credits)


## What is DNSCrypt-Proxyv2 and why do I need it?!

DNSCRypt-proxyv2 is a flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## DNSCrypt Features

- [Please check the official page](https://github.com/DNSCrypt/dnscrypt-proxy#features) to see what DNSCrypt-Proxyv2 has to offer.
- The project related DNSCrypt-Proxyv2 binaries are taken from the [official release page](https://github.com/jedisct1/dnscrypt-proxy/releases).


## Why aren't older Android versions supported?

Magisk itself does not support all (old) Android versions, and I also believe that due to security and privacy reasons older Android versions should not be used anymore. However, you still can use and flash the module, but there will be no support from my side, there will be no support given for older Android versions!


## Donations

**I do not accept donations** for this project, if you want to support someone, please [donate to the original DNSCrypt-Proxyv2 project](https://github.com/DNSCrypt/dnscrypt-proxy). This helps to keep DNSCrypt-Proxyv2 alive and push the project and the original developer.


## Pre-built binaries

Up-2-date, pre-built binaries are available for the following platforms:
- `ARM`
- `ARM64`
- `x86`
- `x86_64`


## Differences between the old DNSCrypt Proxy Magisk project

I dislike that other Magisk Android modules are hosted on Telegram, so I opened this project. It's beyond me why the magisk is been hosted via [GitTea](https://git.nixnet.xyz/quindecim/dnscrypt-proxy-android), the original code is hosted on GitHub so should any other DNSCrypt-proxy related project (_my point of view_).


##### dnscrypt-proxy.toml configurations file

- ✅ `DNSSEC` is required
- ✅ Enabled `dnscrypt_ephemeral_keys` feature *(create a new, unique key for every single DNS query)*
- ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relay)*
- ✅ Enabled `IPv6`, see [here](https://www.ripe.net/publications/news/about-ripe-ncc-and-ripe/the-ripe-ncc-has-run-out-of-ipv4-addresses) why
- ⛔️ `DoH` disabled (due to [privacy concerns](https://github.com/CHEF-KOCH/FFCK/issues/7))
- ℹ️ Set`refused` response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [CleanBrowsing](https://cleanbrowsing.org/) as fallback resolver 
- ℹ️ Use `dnscrypt.nl-ns0` (NL), `dnscrypt.uk-ipv4` (UK), `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnswarden-dc1` (DE), `dnswarden-dc1` (DE), `ibksturm` (CH), `publicarray-au` (AUS), `publicarray-au2` (AUS), `scaleway-fr` (FR) and `v.dnscrypt.uk-ipv4` (UK)


## Installation
1. Download latest `.zip` file from here or from  the [release channel](https://github.com/CHEF-KOCH/dnscrypt-proxy-android/releases) and flash it with Magisk Manager App or manually trough your TWRP recovery. You can also use GitHub's own "download" function to download the entire repository and flash it with your recovery.
2. Reboot.
3. (_optional_) Open [AFWall+](https://github.com/ukanth/afwall) and set (_via custom script_):

**ENTER SCRIPT:**
```
iptables -t nat -A OUTPUT -p tcp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -A OUTPUT -p udp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:53
ip6tables -t nat -A OUTPUT -p tcp ! -d 2606:4700:4700::1111 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -A OUTPUT -p udp ! -d 2606:4700:4700::1111 --dport 53 -j DNAT --to-destination [::1]:5354
```
   
**SHUTDOWN SCRIPT:**
```
iptables -t nat -D OUTPUT -p tcp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -D OUTPUT -p udp ! -d 1.1.1.1 --dport 53 -j DNAT --to-destination 127.0.0.1:53
ip6tables -t nat -D OUTPUT -p tcp ! -d 2606:4700:4700::1111 --dport 53 -j DNAT --to-destination [::1]:5354
ip6tables -t nat -D OUTPUT -p udp ! -d 2606:4700:4700::1111 --dport 53 -j DNAT --to-destination [::1]:5354
```

### Configuration (post-installing)

- You can manually edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` or `/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml` to change DNSCryp-Proxyv2 settings.
- For more in-depth explanation please check the [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration).


## Changelog

You can see the full changelog [here](changelog.md).


## Credits
- DNSCrypt-Proxy2 , [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original magisk module
- [All contributors and authors from the old dnscrypt-module](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
