.. zephyr:board:: same51_cnano

Overview
********

The SAM E51 Curiosity Nano Evaluation Kit is a hardware platform to evaluate the SAME51J20A
microcontroller.

Hardware
********

- SAME51J20A ARM Cortex-M4F microcontroller at 120 MHz
- 1 MiB flash memory and 256 KiB of RAM
- 32.768 kHz crystal
- One user LED (yellow)
- One mechanical user switch
- On-board debugger

  - Board identification in MPLAB X IDE
  - One Green power/status LED
  - Programming and debugging
  - Virtual COM port (CDC)
  - One logic analyzer (DGI GPIO)
  - USB powered

- Adjustable target voltage

  - MIC5353 LDO regulator controlled by the on-board debugger
  - 1.8-3.6v output voltage
  - 500 mA maximum output current (limited by ambient temperature and output voltage)

Supported Features
==================

.. zephyr:board-supported-hw::

Connections and IOs
===================

The `SAM E51 Curiosity Nano User Guide`_ has detailed information about board connections.

Default Zephyr Peripheral Mapping
---------------------------------

- SERCOM1 SPI MOSI : PA16
- SERCOM1 SPI SCK  : PA17
- SERCOM1 SPI MISO : PA19
- GPIO SPI CS      : PA18
- SERCOM2 I2C SDA  : PA12
- SERCOM2 I2C SCL  : PA13
- SERCOM4 USART TX : PB12
- SERCOM4 USART RX : PB13
- SERCOM5 USART TX : PB16
- SERCOM5 USART RX : PB17
- ADC0 AIN4, AIN7  : PA04, PA07
- DAC VOUT0        : PA02
- GPIO/PWM LED0    : PA14
- GPIO SW0         : PA15

System Clock
------------

The 32.768 kHz crystal is the reference for FDPLL0, which generates the 120 MHz CPU clock on
GCLK0. GCLK1 runs at 60 MHz and clocks the SERCOM and ADC peripherals. GCLK2 runs at 12 MHz and
clocks the DAC. The RTC is clocked from the 1.024 kHz output of the crystal oscillator.

Serial Port
-----------

SERCOM5 is the Zephyr console and is connected to the virtual COM port of the On-Board Nano
Debugger. SERCOM4 is available on the edge connector. Both are configured for 115200 8n1.

PWM
---

LED0 is connected to TCC2 waveform output 0 and can be driven by TCC2 channel 0. The ``pwm-led0``
alias uses inverted polarity because LED0 is active low.

SPI Port
--------

SERCOM1 is configured as an SPI controller on the edge connector, with PA18 used as a GPIO chip
select.

I2C Port
--------

SERCOM2 is configured as an I2C controller on the edge connector at 400 kHz. No I2C devices are
present on the board.

ADC and DAC
-----------

ADC0 inputs AIN4 and AIN7 are configured on the edge connector. DAC output VOUT0 is configured on
PA02 and uses the analog supply as its reference.

Flash Partitions
----------------

The flash memory is divided into a 64 KiB MCUboot partition, two 448 KiB image slots and a 64 KiB
``storage`` partition.

Programming and Debugging
*************************

.. zephyr:board-supported-runners::

Prerequisites
=============

Ensure that the pyOCD CMSIS-Pack for the SAME51J20A microcontroller is installed.

.. code-block:: shell

   pyocd pack install atsame51j20a

Flashing
========

Build and flash the application.

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: same51_cnano
   :goals: flash

Debugging
=========

Build and run the debug server for the application.

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: same51_cnano
   :goals: debugserver

Connect to the debug server as described in the :ref:`develop_debug` page.

References
**********

SAM E51 Curiosity Nano Evaluation Kit Product Page:
    https://www.microchip.com/en-us/development-tool/EV76S68A

.. _SAM E51 Curiosity Nano User Guide:
    https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/UserGuides/SAM-E51-Curiosity-Nano-User-Guide-DS70005432.pdf
