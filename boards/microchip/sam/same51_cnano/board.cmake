# SPDX-License-Identifier: Apache-2.0

board_runner_args(pyocd
    "--target=ATSAME51J20A"
    "--frequency=400000"
)

include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)