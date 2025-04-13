# eul - Liquid Cooling Fork

![Preview](https://user-images.githubusercontent.com/14722250/105626766-f718ab00-5e6c-11eb-9761-661ff85c8faf.jpg)

> This is a fork of the original [eul by gao-sun](https://github.com/gao-sun/eul) with added liquid cooling information support.

## Highlights

- Everything from the original eul
- **NEW:** Liquid cooling information support
  - Shows temperature and flow data from compatible devices
  - Integrates seamlessly with the existing eul interface

## OS Requirement

macOS 15 Sonoma minimum

## Additional Requirements for Liquid Cooling

- Tested and working with the Aquacomputer Quadro controller on a hackintosh setup
- The internal USB port of the controller must be properly mapped
- [liquidctl](https://github.com/liquidctl/liquidctl) must be installed:
  ```bash
  brew install liquidctl
  ```

## Installation

Download the latest release directly and drag `.app` file into your `Application` folder.

## Credits

- Original eul application by [gao-sun](https://github.com/gao-sun/eul)
- [liquidctl](https://github.com/liquidctl/liquidctl) for the liquid cooling interface
