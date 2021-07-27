FROM rust:bullseye AS build
RUN git clone --depth=1 https://github.com/cloudflare/boringtun.git && \
    cd boringtun && \
    cargo build --bin boringtun --release && \
    strip ./target/release/boringtun

FROM debian:bullseye-slim AS runtime
COPY --from=build /boringtun/target/release/boringtun /bin
RUN apt update && \
    apt install -y --no-install-suggests wireguard iproute2 iptables
ENV WG_LOG_LEVEL=info \
    WG_LOG_FILE=/var/log/boringtun \
    WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun \
    WG_SUDO=1
EXPOSE 51820/udp
CMD wg-quick up wg0 && \
    echo "wg-quick has successfully finished.\n\nReading boringtun logs:" && \
    tail -f "${WG_LOG_FILE}"
