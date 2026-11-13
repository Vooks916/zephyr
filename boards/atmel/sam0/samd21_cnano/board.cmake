# SPDX-License-Identifier: Apache-2.0

board_runner_args(pyocd
    "--target=ATSAMD21G17D"
    "--frequency=400000"
)

include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)