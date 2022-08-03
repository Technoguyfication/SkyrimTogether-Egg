FROM tiltedphoques/st-reborn-server:latest as base

FROM alpine:latest as final

# Note: The install script run on the container will copy the files out of this image and onto the persistent mounted storage on the Pterodactyl server.

# Copy libstdc++6 to final image
COPY --from=base /lib/x86_64-linux-gnu/libstdc++.so.6 /home/server/libstdc++.so.6

# Copy server binaries to final image
COPY --from=base /home/server/ /home/server
