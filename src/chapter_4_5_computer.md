# Single Board Computer

If any problems with some devices occur please report them [here](https://github.com/dump-dvb/dump-dvb.nix/issues).

## Devices we recommend using.

- **any x86 64bit thin clients**
- **nixos compatible**

Devices listed below are actively **tested** and run in **production**:

### DELL Wyse 3040

**Product Page** can be found [here](https://www.dell.com/support/home/en-us/product-support/product/wyse-3040-thin-client/overview)

Works absolutely fabolus and is probably the cheapest on this list but sadly discontinued by dell.

### Raspberry Pi 3b and 4

Probably everybody has one at home has enough resources to work but redeployment is a little bit scary. Furthermore there is a nice POE-Hat (Power over Ethernet) for PI 3B+ and 4.

## Devices we discourage from using

- **Raspberry Pi 0,1,2**: are old 32bit architectures for which cross compiling gets increasingly difficult.

- Everything that doesn't have at least one USB-3 Port + Another USB Port for suppling power to the hardware filter.
- Everything that isn't X86 64bit or Aarch64
- Ethernet is also quite nice
