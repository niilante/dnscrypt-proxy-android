# DNSCrypt Proxy 2 for Android via Magisk

The project aims to bring DNSCrypt-Proxyv2 to Android via [Magisk module](https://www.xda-developers.com/how-to-install-magisk/).


## What is DNSCrypt-Proxyv2 and why do I need it?!

DNSCRypt-proxyv2 is a flexible DNS proxy, with support for modern encrypted DNS protocols such as [DNSCrypt v2](https://dnscrypt.info/protocol), [DNS-over-HTTPS](https://www.rfc-editor.org/rfc/rfc8484.txt) and [Anonymized DNSCrypt](https://github.com/DNSCrypt/dnscrypt-protocol/blob/master/ANONYMIZED-DNSCRYPT.txt).


## Features

- [Please check the official page](https://github.com/DNSCrypt/dnscrypt-proxy#features) to see what DNSCrypt-Proxyv2 has to offer.
- The project related DNSCrypt-Proxyv2 binaries are taken from the [official release page](https://github.com/jedisct1/dnscrypt-proxy/releases).


## Donations

**I do not accept donations** for this project, if you want to support someone, please [donate to the original DNSCrypt-Proxyv2 project](https://github.com/DNSCrypt/dnscrypt-proxy). This helps to keep DNSCrypt-Proxyv2 alive and push the project and the original developer.

## Pre-built binaries

Up-to-date, pre-built binaries are available for:
- `Android/arm`
- `Android/arm64`
- `Android/x86`
- `Android/x86_64`


## Differences between the old DNSCrypt Proxy Magisk project

I dislike that other Magisk Android modules are hosted on Telegram, so I opened this project. It's beyond me why the magisk is been hosted via GitTea](https://git.nixnet.xyz/quindecim/dnscrypt-proxy-android), the original code is hosted on GitHub so should any other DNSCrypt-proxy related project (_my point of view_).


##### dnscrypt-proxy.toml configurations file

- ✅ `DNSSEC` is required
- ✅ Enabled `dnscrypt_ephemeral_keys` feature *(create a new, unique key for every single DNS query)*
- ✅ Enabled `anonymized_dns` feature *(each resolver has 2 relay)*
- ✅ Enabled `IPv6`, see [here](https://www.ripe.net/publications/news/about-ripe-ncc-and-ripe/the-ripe-ncc-has-run-out-of-ipv4-addresses) why
- ⛔️ `DoH` disabled (due to [privacy concerns](https://github.com/CHEF-KOCH/FFCK/issues/7))
- ℹ️ Set`refused` response to blocked queries
- ℹ️ Set DNS query max. response time from `5000` to `1500`, in ms.
- ℹ️ Use [UncensoredDNS](https://blog.uncensoreddns.org/) as fallback resolver instead CloudFlare
- ℹ️ Use `dnscrypt.nl-ns0` (NL), `dnscrypt.uk-ipv4` (UK), `dnscrypt.eu-dk` (DK), `dnscrypt.eu-nl` (NL), `dnswarden-dc1` (DE), `dnswarden-dc1` (DE), `ibksturm` (CH), `publicarray-au` (AUS), `publicarray-au2` (AUS), `scaleway-fr` (FR) and `v.dnscrypt.uk-ipv4` (UK)


## Installation
1. Download latest `.zip` file from here or from  the [release channel](https://github.com/CHEF-KOCH/dnscrypt-proxy-android/releases) and flash it with Magisk Manager App or manually trough your TWRP recovery. You can also use GitHub's own "download" function to download the entire repository and flash it with your recovery.
2. Reboot.
3. (_optional_) Open [AFWall+](https://github.com/ukanth/afwall) and set (_via custom script_):

**ENTER SCRIPT:**
```
iptables -t nat -A OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -A OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
```
   
**SHUTDOWN SCRIPT:**
```
iptables -t nat -D OUTPUT -p tcp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
iptables -t nat -D OUTPUT -p udp ! -d 91.239.100.100 --dport 53 -j DNAT --to-destination 127.0.0.1:53
```

### Configuration (post-installing)

- You can edit `dnscrypt-proxy.toml` as you wish located on `/sdcard/dnscrypt-proxy/dnscrypt-proxy.toml` [or /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml]
- For more detailed configuration please refer to [official documentation](https://github.com/jedisct1/dnscrypt-proxy/wiki/Configuration)
- FOR MORE SUPPORT ON A GOOD PRIVACY-ORIENTED SETUP, JOIN [dnscrypt-proxy-android | CHAT](https://t.me/qd_invitation) ON TELEGRAM


## Changelog

You can see the full changelog [here](changelog.md).


## Credits
- DNSCrypt-Proxy2 upstream | [jedisct1](https://github.com/jedisct1/dnscrypt-proxy)
- [bluemeda](https://github.com/bluemeda) for the original magisk module
- [All contributors and authors from the old dnscrypt-module](https://github.com/Magisk-Modules-Repo/dnscrypt-proxy/graphs/contributors)
