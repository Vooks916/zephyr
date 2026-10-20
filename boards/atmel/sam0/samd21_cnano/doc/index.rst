.. zephyr:board:: samd21_cnano

Overview
********

The SAM D21 Curiosity Nano Evaluation Kit is a hardware platform for evaluating the SAMD21G17 microcontroller.

Hardware
********

- SAMD21G17D microcontroller
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

The `SAM D21 Curiosity Nano Evalution Kit User Guide`_ has detailed information about board connections.

Programming and Debugging
*************************

.. zephyr:board-supported-runners::

Flashing
========

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: samd21_cnano
   :goals: flash


Debugging
=========

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: samd21_cnano
   :goals: debugserver


References
**********

.. target-notes::

.. _SAM D21 Curiosity Nano Evaluation Kit Product Page:
    https://www.microchip.com/en-us/development-tool/DM320119

.. _SAM D21 Curiosity Nano Evalution Kit User Guide:
    https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/UserGuides/SAMD21-Curiosity-Nano-Evaluation-Kit-User-Guide-DS70005409D.pdf
