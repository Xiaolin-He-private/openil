################################################################################
#
# libnetconf
#
################################################################################

LIBNETCONF_VERSION = master
LIBNETCONF_SITE = https://github.com/CESNET/libnetconf.git
LIBNETCONF_SITE_METHOD = git
LIBNETCONF_INSTALL_STAGING = YES
LIBNETCONF_LICENSE = MIT
LIBNETCONF_LICENSE_FILES = COPYING

HOST_LIBNETCONF_DEPENDENCIES = host-pkgconf pyang
LIBNETCONF_DEPENDENCIES = libxml2 openssl libgcrypt libssh libxslt ncurses readline dbus pyang python-libxml2 host-python

define LIBNETCONF_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/dev-tools/lnctool/lnctool $(HOST_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/libnetconf.pc $(STAGING_DIR)/usr/lib/pkgconfig
	$(INSTALL) -D -m 0755 $(@D)/.libs/libnetconf.so* $(STAGING_DIR)/usr/lib/
	$(INSTALL) -D -m 0755 $(@D)/headers/*.h $(STAGING_DIR)/usr/include
	mkdir -p $(STAGING_DIR)/usr/include/libnetconf
	$(INSTALL) -D -m 0755 $(@D)/src/*.h $(STAGING_DIR)/usr/include/libnetconf/
	$(INSTALL) -D -m 0755 $(@D)/src/datastore/custom/datastore_custom.h $(STAGING_DIR)/usr/include/libnetconf/
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))

