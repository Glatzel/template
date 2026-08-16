#!/usr/bin/env bash
set -euo pipefail

apt_packages=(
    ca-certificates
    openssl
    systemd
    libasound2
    libc6
    libcups2
    libcurl4
    libdbus-1-3
    libdrm2
    libegl1
    libexpat1
    libfontconfig1
    libgcc-s1
    libgl1
    libglib2.0-0
    libglu1-mesa
    libglx0
    libice6
    libncursesw6
    libnspr4
    libnss3
    libopengl0
    libpci3
    libsm6
    libxcb-cursor0
)

dnf_packages=(
    ca-certificates
    openssl
    systemd
    alsa-lib
    cups-libs
    dbus-libs
    expat
    fontconfig
    glib2
    glibc
    libcurl
    libdrm
    libgcc
    libglvnd-egl
    libglvnd-glx
    libglvnd-opengl
    libICE
    libSM
    libstdc++
    libuuid
    libX11
    libX11-xcb
    libxcb
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXi
    libxkbcommon
    libxkbcommon-x11
    libxkbfile
    libXrandr
    libXrender
    libxshmfence
    libXt
    libXtst
    mesa-libGLU
    ncurses-libs
    nspr
    nss
    nss-util
    nxagent
    pciutils-libs
    xcb-util-cursor
    xcb-util-image
    xcb-util-keysyms
    xcb-util-renderutil
    xcb-util-wm
)

if [[ -f /etc/os-release ]]; then
    source /etc/os-release
else
    echo "Cannot detect operating system" >&2
    exit 1
fi

echo "Detected: ${PRETTY_NAME:-unknown}"

case "$ID" in
    debian|ubuntu|linuxmint|pop)
        apt-get update

        packages=()

        for package in "${apt_packages[@]}"; do
            if apt-cache show "${package}t64" >/dev/null 2>&1; then
                packages+=("${package}t64")
                echo "  $package -> ${package}t64"
            elif apt-cache show "$package" >/dev/null 2>&1; then
                packages+=("$package")
                echo "  $package -> $package"
            else
                echo "ERROR: package not found: $package" >&2
                exit 1
            fi
        done

        apt-get install -y --no-install-recommends "${packages[@]}"
        ;;

    rhel|rocky|almalinux|fedora)
        if command -v dnf >/dev/null 2>&1; then
            dnf install -y "${dnf_packages[@]}"
        else
            yum install -y "${dnf_packages[@]}"
        fi
        ;;

    *)
        echo "Unsupported distribution: $ID" >&2
        exit 1
        ;;
esac
