.. zephyr:board:: samd21_cnano

Overview
********

The SAM D21 Curiosity Nano Evaluation Kit is a hardware platform for evaluating the SAMD21G17
microcontroller.

Hardware
********

- SAMD21G17D ARM Cortex-M0+ microcontroller at 48 MHz
- 128 KiB flash memory and 16 KiB of RAM
- One yellow user LED
- One mechanical user switch
- On-Board Nano Debugger

  - Board identification in MPLAB X IDE
  - One green power/status LED
  - Programing and debugging
  - Virtual COM port (CDC)
  - One logic analyzer (DGI GPIO)

- USB powered
- Adjustable target voltage

  - MIC5353 LDO regulator controlled by the On-Board Nano Debugger
  - 1.7V to 3.6V output voltage
  - 500 mA maximum output current (limited by ambient temperature and output voltage)

Supported Features
==================

.. zephyr:board-supported-hw::

Connections and IOs
===================

The `SAM D21 Curiosity Nano Evaluation Kit User Guide`_ has detailed information about board
connections.

Default Zephyr Peripheral Mapping
---------------------------------

- SERCOM0 USART TX : PA08
- SERCOM0 USART RX : PA09
- SERCOM1 SPI MOSI : PA16
- SERCOM1 SPI SCK  : PA17
- SERCOM1 SPI MISO : PA19
- GPIO SPI CS      : PA18
- SERCOM4 I2C SDA  : PA12
- SERCOM4 I2C SCL  : PA13
- SERCOM5 USART TX : PA22
- SERCOM5 USART RX : PB22
- ADC AIN1 - AIN7  : PA03, PB08, PB09, PA04, PA05, PA06, PA07
- DAC VOUT         : PA02
- GPIO/PWM LED0    : PB10
- GPIO SW0         : PB11

System Clock
------------

The 32.768 kHz crystal is not connected to the SAMD21 by default. The internal 8 MHz RC
oscillator is the reference for the DFLL, which generates the 48 MHz system clock. The internal
32.768 kHz RC oscillator clocks the RTC.

Serial Port
-----------

SERCOM5 is the Zephyr console and is connected to the virtual COM port of the On-Board Nano
Debugger. SERCOM0 is available on the edge connector. Both are configured for 115200 8n1.

PWM
---

LED0 is connected to TCC0 waveform output 4. If :kconfig:option:`CONFIG_PWM_SAM0_TCC` is enabled,
LED0 can be driven by TCC0 channel 0. LED0 is active low, so the brightness is inverted with
respect to the duty cycle.

SPI Port
--------

SERCOM1 is configured as an SPI controller on the edge connector, with PA18 used as a GPIO chip
select.

I2C Port
--------

SERCOM4 is configured as an I2C controller on the edge connector at 400 kHz. No I2C devices are
present on the board.

ADC and DAC
-----------

ADC inputs AIN1 to AIN7 are configured on the edge connector. AIN0 shares PA02 with the DAC
output and is not configured.

Flash Partitions
----------------

The last 8 KiB of the flash memory is reserved as the ``storage`` partition.

USB
---

The USB connector on the board is connected to the On-Board Nano Debugger. The SAMD21 USB pins,
PA24 (D-) and PA25 (D+), are only available on the edge connector, so the SAMD21 USB device
controller is not enabled. It can be enabled with a devicetree overlay:

.. code-block:: devicetree

   &pinctrl {
           usb_dc_default: usb_dc_default {
                   group1 {
                           pinmux = <PA25G_USB_DP>, <PA24G_USB_DM>;
                   };
           };
   };

   zephyr_udc0: &usb0 {
           status = "okay";
           pinctrl-0 = <&usb_dc_default>;
           pinctrl-names = "default";
   };

Programming and Debugging
*************************

.. zephyr:board-supported-runners::

Prerequisites
=============

Ensure that the pyOCD CMSIS-Pack for the SAMD21G17D microcontroller is installed.

.. code-block:: shell

   pyocd pack install atsamd21g17d

Flashing
========

Build and flash the application.

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: samd21_cnano
   :goals: flash

Debugging
=========

Build and run the debug server for the application.

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: samd21_cnano
   :goals: debugserver

Connect to the debug server as described in the :ref:`develop_debug` page.

References
**********

SAM D21 Curiosity Nano Evaluation Kit Product Page:
    https://www.microchip.com/en-us/development-tool/DM320119

.. _SAM D21 Curiosity Nano Evaluation Kit User Guide:
    https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/UserGuides/SAMD21-Curiosity-Nano-Evaluation-Kit-User-Guide-DS70005409D.pdf
