# Single Board Computer

If any problems with some devices occur please report them [here](https://github.com/dump-dvb/dump-dvb.nix/issues).

## Devices we recommend using.

- **any x86 64bit thin clients**
- **nixos compatible**

Devices listed below are actively **tested** and run in **production** if you have devices running
not listed here please report them to us so we can expand this list.

|device name|architecture|notes|working|
|-----------|------------|-----|-------|
|Dell Wyse 3040|x86_64| insanely cheap, standard device we use | ✅|
|Raspberry Pi 3B+| aarch64| resolvable problems with bootloader on nixos | ✅|
|Raspberry Pi 4| aarch64| very nice with POE hat | ✅|

## Devices we discourage from using

- **Raspberry Pi 0,1,2**: are old 32bit architectures for which cross compiling gets increasingly difficult.

- Everything that doesn't have at least one USB-3 Port + Another USB Port for suppling power to the hardware filter.
- Everything that isn't X86 64bit or Aarch64
- Ethernet is also quite nice
