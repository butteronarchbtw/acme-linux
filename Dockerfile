FROM ghcr.io/lix-project/lix:latest AS acme

WORKDIR /app
COPY . .
RUN nix  --experimental-features 'nix-command flakes' build .#acme

FROM ghcr.io/lix-project/lix:latest AS sam

WORKDIR /app
COPY . .
RUN nix  --experimental-features 'nix-command flakes' build .#sam

FROM ghcr.io/lix-project/lix:latest AS plan9tools

WORKDIR /app
COPY . .
RUN nix  --experimental-features 'nix-command flakes' build .#plan9tools
