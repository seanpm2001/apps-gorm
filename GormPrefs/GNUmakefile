#
# GNUmakefile 
# Written by Gregory John Casamento <greg_casamento@yahoo.com>
#
# NOTE: Do NOT change this file -- ProjectCenter maintains it!
#
# Put all of your customisations in GNUmakefile.preamble and
# GNUmakefile.postamble
#

include $(GNUSTEP_MAKEFILES)/common.make
GNUSTEP_INSTALLATION_DIR = $(GNUSTEP_SYSTEM_ROOT)


#
# Subprojects
#



#
# Framework
#

PACKAGE_NAME=GormPrefs

ifeq ($(GNUSTEP_TARGET_OS),mingw32)
LIBRARY_VAR=GORMPREFS
LIBRARY_NAME=GormPrefs
else
FRAMEWORK_VAR=GORMPREFS
FRAMEWORK_NAME=GormPrefs
endif

GormPrefs_HEADER_FILES_DIR=.
GormPrefs_HEADER_FILES_INSTALL_DIR=/GormPrefs
ADDITIONAL_INCLUDE_DIRS = -I..
srcdir = .

#
# Additional libraries
#

GormPrefs_LIBRARIES_DEPEND_UPON += -lgnustep-gui -l$(FOUNDATION_LIBRARY_NAME)

#
# Header files
#

GormPrefs_HEADER_FILES= \
GormColorsPref.h \
GormGeneralPref.h \
GormGuidelinePref.h \
GormHeadersPref.h \
GormPalettesPref.h \
GormPrefController.h \
GormShelfPref.h

#
# Class files
#

GormPrefs_OBJC_FILES= \
GormColorsPref.m \
GormGeneralPref.m \
GormGuidelinePref.m \
GormHeadersPref.m \
GormPalettesPref.m \
GormPrefController.m \
GormShelfPref.m

#
# Resources
#
GormPrefs_LOCALIZED_RESOURCE_FILES= \
GormPrefColors.gorm \
GormPreferences.gorm \
GormPrefGeneral.gorm \
GormPrefGuideline.gorm \
GormPrefHeaders.gorm \
GormPrefPalettes.gorm \
GormShelfPref.gorm

#
# Languages
#
GormPrefs_LANGUAGES= \
English

#
# C files
#

GormPrefs_C_FILES= 

HEADERS_INSTALL = $(GormPrefs_HEADER_FILES)

-include GNUmakefile.preamble
-include GNUmakefile.local

ifeq ($(GNUSTEP_TARGET_OS),mingw32)
include $(GNUSTEP_MAKEFILES)/library.make
else
include $(GNUSTEP_MAKEFILES)/framework.make
endif

-include GNUmakefile.postamble
