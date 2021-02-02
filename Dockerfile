# https://github.com/sapk/dockerfiles/tree/master/archlinux
FROM sapk/archlinux:aarch64
RUN pacman -Syu --overwrite=* --noconfirm python3; \
	pacman -Scc --noconfirm; \
	rm -r /usr/share/man/*; \
	rm -r /usr/share/locale/*; \
	rm -rf /var/cache/pacman/pkg/*
ENTRYPOINT ["/bin/bash"]
