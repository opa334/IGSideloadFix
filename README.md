# Sideload Tweaked Instagram

Requires theos (https://github.com/theos/theos) and theos-jailed (https://github.com/kabiroberai/theos-jailed).

Please do not ask me to distribute a pre patched IPA, doing so would be a copyright violation that I do not want to commit.

## How to use

1. Get a decrypted IPA of Instagram put it into the root folder of this repo as "Instagram.ipa"

2. Maybe change BUNDLE_ID in Makefile to something else

3. Run `make package FINALPACKAGE=1` to compile an IPA that works when sideloaded, if you want to compile an unsigned ipa, run `make package FINALPACKAGE=1 CODESIGN_IPA=0`, if you want to compile an ipa for TrollStore, run `make package FINALPACKAGE=1 TROLLSTORE=1 FAKESIGN_IPA=1` (until my theos-jailed PR has been accepted, make sure to use my fork of theos-jailed).

4. Additionally, if you want to add a tweak dylib, also put the dylib into this folder and add it to Hackogram_INJECT_DYLIBS in the Makefile

## Rocket for Instagram

1. Get a deb of Rocket via cydownload (https://github.com/borishonman/cydownload/releases) or a similar tool and extract it (or alternatively get the files below from a jailbroken device that has Rocket installed)

2. Put /Library/Application Support/Rocket/Rocket.bundle into the Resources folder of this repo (to Resources/Rocket.bundle/(DateTools.bundle/MoPub.bundle/...))

3. Get the rocket dylib from /usr/lib/Rocket.dylib inside the deb and open the arm64 slice in Hopper

4. Replace the first two instructions of +[RABuildManager installType] with `mov x0, #0x1; ret;` to make Rocket think it was built for sideloaded installs

5. Export patched binary, keep invalid code signature when prompted

6. Put the patched Rocket dylib into the root folder of this repo

7. Add the dylib name to Hackogram_INJECT_DYLIBS in Makefile
