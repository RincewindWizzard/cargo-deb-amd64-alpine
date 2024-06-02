# Stage 1: Build cargo-deb
FROM rust:alpine AS builder

# Install cargo-deb
RUN apk add --no-cache musl-dev  gcc

RUN cargo install cargo-deb




FROM rust:alpine

#RUN apk add --no-cache curl gcc
#RUN curl –proto ‘=https’ –tlsv1.2 -sSf https://sh.rustup.rs | sh -s  -- -y
#ENV PATH="/root/.cargo/bin:${PATH}"
#RUN cargo install cargo-deb

COPY --from=builder /usr/local/cargo/bin/cargo-deb /usr/local/bin/cargo-deb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
