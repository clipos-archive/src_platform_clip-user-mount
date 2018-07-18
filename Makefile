# SPDX-License-Identifier: LGPL-2.1-or-later
# Copyright © 2007-2018 ANSSI. All Rights Reserved.
SCRIPTS := mount.clip mount.crypt mount.nocrypt mount.rm umount.clip dmcleanup restrict-nonetwork mkvartmp mkknownhosts rm-ipc-cleanup
BIN_SCRIPTS := xdm-issue fail-login ipc-cleanup
INCLUDES := usermount.sub
PAM := 100-user-mount.conf 500-user-umount.conf

INST_SCRIPTS := install -D -m 0500
INST_BIN_SCRIPTS := install -D -m 0555
INST_INCLUDES := install -D -m 0400
INST_PAM := install -D -m 0400

all:
	@echo "nothing to see here, move along"

install: install_scripts install_bin_scripts install_includes install_pam

install_scripts:
	${foreach file, ${SCRIPTS}, ${INST_SCRIPTS} scripts/$(file) ${DESTDIR}/sbin/$(file); }

install_bin_scripts:
	${foreach file, ${BIN_SCRIPTS}, ${INST_BIN_SCRIPTS} bin_scripts/$(file) ${DESTDIR}/usr/bin/$(file); }

install_includes:
	${foreach file, ${INCLUDES}, ${INST_INCLUDES} scripts/$(file) ${DESTDIR}/lib/clip/$(file); }

install_pam:
	${foreach file, ${PAM}, ${INST_PAM} pam_conf/$(file) ${DESTDIR}/etc/security/exec.conf.d/$(file); }

