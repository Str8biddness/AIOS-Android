# AIOS-Android Build Guide

## Complete AOSP 4.0.1 ICS to AIOS-Android Transformation

This guide provides comprehensive instructions for building AIOS-Android from AOSP 4.0.1_r1 (Ice Cream Sandwich).

## Project Overview

AIOS-Android transforms vanilla Android 4.0.1 Ice Cream Sandwich into an AI Operating System base layer with:
- Custom AIOS framework services (Brain, Perception, Actuation, Memory)
- Modified system server and package/activity/window managers  
- Init process modifications for AIOS boot sequence
- SELinux policies for AIOS processes
- Native daemons and clustering support
- Custom launcher and system UI

## Prerequisites

- Ubuntu 14.04 or 16.04 (for AOSP 4.0.1 compatibility)
- 100GB+ disk space
- 8GB+ RAM
- Java 6 JDK
- Build tools: make, gcc, g++, python

## Step 1: Download AOSP 4.0.1_r1

```bash
# Install repo tool
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

# Initialize AOSP 4.0.1_r1
mkdir ~/aios-android
cd ~/aios-android
repo init -u https://android.googlesource.com/platform/manifest -b android-4.0.1_r1
repo sync -j16
```

## Step 2: Apply AIOS Modifications

Clone this repository into your AOSP tree:

```bash
cd ~/aios-android
git clone https://github.com/Str8biddness/AIOS-Android aios-modifications
cp -r aios-modifications/frameworks/* frameworks/
cp -r aios-modifications/system/* system/
```

## Step 3: Build Configuration

Create device configuration:

```bash
# Create device/aios/aios-base directory
mkdir -p device/aios/aios-base
```

## Remaining Files to Create

This repository contains the core AIOS modifications. Additional files needed:

### Framework Layer
1. AIosPerceptionService.java - System event monitoring
2. AIosActuationService.java - System control service  
3. AIosMemoryService.java - Consciousness database
4. Activity/Window/Power Manager modifications
5. PackageManager AIOS module support

### Native Layer
6. libaios.so - Native AIOS library
7. aiosd - AIOS daemon
8. JNI bindings

### Build System
9. device/aios/aios-base/BoardConfig.mk
10. build/target/product/aios.mk
11. vendor/aios overlays

### Applications
12. packages/apps/AiosLauncher
13. SystemUI modifications
14. Settings AIOS pages

### Security
15. sepolicy/aios.te
16. sepolicy/aios_contexts

## Build Commands

```bash
source build/envsetup.sh
lunch aios_generic-eng
make -j8 AIOS_BUILD=1
```

## Flash to Device

```bash
fastboot flashall -w
```

## Development Status

Current implementation includes:
- ✅ SystemServer with AIOS integration
- ✅ AIosBrainService core consciousness
- ✅ AIDL interface definitions  
- ✅ init.aios.rc boot configuration
- ⏳ Additional services and managers
- ⏳ Build system integration
- ⏳ Native daemons
- ⏳ AIOS applications

## Contributing

See individual component directories for detailed implementation guides.

## License

Apache License 2.0 - See LICENSE file
