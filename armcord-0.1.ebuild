EAPI=8

DESCRIPTION="ArmCord is a Discord client for the Arm architecture. It is based on the official Discord client for Linux. It is not affiliated with Discord Inc. in any way."

HOMEPAGE="https://armcord.app/"

SRC_URI="https://github.com/ArmCord/ArmCord/releases/download/v3.2.7/ArmCord_3.2.7_arm64.deb"

S="${WORKDIR}"

LICENSE="OSL-3.0"

SLOT="0.1"

KEYWORDS="~arm64"

RDEPEND=">=gui-libs/gtk-4.12.5-r1
		>=x11-libs/libnotify-0.8.3
		>=dev-libs/nss-3.90.2-r1
		>=x11-misc/xdg-utils-1.2.1-r1
		>=dev-python/pyatspi-2.46.0
		>=app-crypt/libsecret-0.21.1
		>=x11-libs/libXtst-1.2.4
		>=x11-libs/libXScrnSaver-1.2.3
		"

src_install() {
	# Unpack the deb
	ar -x "${S}/ArmCord_3.2.7_arm64.deb"
	# Unpack unpacked
	tar -xf "${S}/control.tar.gz"
	unxz "${S}/data.tar.xz"
	tar -xf "${S}/data.tar"
	# Move files to end dest
	mv "${S}/opt" "${D}"
	mv "${S}/usr" "${D}"
}
