.. zephyr:board:: same51_cnano

Overview
********

The SAM E51 Curiosity Nano Evaluation Kit is a hardware platform to evaluate the SAME51J20A
microcontroller.

Hardware
********

- SAME51J20A microcontroller
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

.. zephyr-app-commands:: :zephyr-app: samples/basic/blinky
   :board: same51_cnano
   :goals: debugserver

Connect to the debug server as described in the :ref:`develop_debug` page.

References
**********

SAM E51 Curiosity Nano Evaluation Kit Product Page:
    https://www.microchip.com/en-us/development-tool/EV76S68A

.. _SAM E51 Curiosity Nano User Guide:
    https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/UserGuides/SAM-E51-Curiosity-Nano-User-Guide-DS70005432.pdf
