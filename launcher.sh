#!/bin/sh

exec /usr/local/bin/quake3e.ded.x64 \
	+set dedicated "${DEDICATED:-2}" \
	+set fs_game "${FS_GAME:-baseq3}" \
	+set rconpassword "${RCONPASSWORD:?RCONPASSWORD is required}" \
	+exec "${SERVER_CFG:-server.cfg}"
