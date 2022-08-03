FROM tiltedphoques/st-reborn-server:latest as base

FROM alpine:latest as final

COPY --from=base /lib/x86_64-linux-gnu/libstdc++.so.6 /home/server/libstdc++.so.6
# COPY --from=base /lib/x86_64-linux-gnu/libstdc++.so.6 /lib/aarch64-linux-gnu/libstdc++.so.6

COPY --from=base /home/server/libSTServer.so /home/server/libSTServer.so
COPY --from=base /home/server/SkyrimTogetherServer /home/server/SkyrimTogetherServer
COPY --from=base /home/server/crashpad_handler /home/server/crashpad_handler
COPY --from=base /home/server/libSTServer.debug /home/server/libSTServer.debug
COPY --from=base /home/server/SkyrimTogetherServer.debug /home/server/SkyrimTogetherServer.debug
