# BoringTun in Docker

## Supported tags and respective `Dockerfile` links

- [`latest`, `bullseye`](https://github.com/chernetskyi/boringtun-docker/blob/main/Dockerfile.bullseye)
- [`alpine`](https://github.com/chernetskyi/boringtun-docker/blob/main/Dockerfile.alpine)

## What is BoringTun?

**BoringTun** is an implementation of the [WireGuard<sup>®</sup>](https://www.wireguard.com/) protocol designed for portability and speed.

[https://blog.cloudflare.com/boringtun-userspace-wireguard-rust/](https://blog.cloudflare.com/boringtun-userspace-wireguard-rust/)

![BoringTun Logo](https://github.com/chernetskyi/boringtun-docker/blob/main/boringtun.png)

## How to use this image

### WireGuard configuration file

Provide WireGuard configuration file to `/etc/wireguard/${INTERFACE}.cnf`.

`-v ./wireguard.conf:/etc/wireguard/wg0.conf`

### Privileges

Enable IPv4 forwarding `--sysctl net.ipv4.ip_forward=1`.

Give extended privileges to this container `--privileged`.

### Environment variables

`INTERFACE`

Set the name of created interface. Respective WireGuard configuration file name is `/etc/wireguard/${INTERFACE}.cnf` Default: `wg0`.

`WG_LOG_LEVEL`

Set the verbosity level of logging messages. One of: `error`, `info`, `debug`, `trace`. Default: `info`.

`WG_LOG_FILE`

Set the logging file destination. Default: `/var/log/boringtun`.

`WG_THREADS`

Set the number of OS threads to use. Default: `4`.

## License

The project is licensed under the [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause).

---

<sub><sub><sub><sub>WireGuard is a registered trademark of Jason A. Donenfeld. BoringTun is not sponsored or endorsed by Jason A. Donenfeld.</sub></sub></sub></sub>
