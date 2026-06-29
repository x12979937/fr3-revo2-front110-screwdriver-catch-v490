#!/usr/bin/env bash
set -euo pipefail

PYTHON_BIN="${ISAACGYM_PYTHON:-/autodl-fs/data/mingyu/IsaacGym/envs/isaacgym_py38/bin/python}"
SCRIPT="scripts/run_ring_drop_screwdriver_motion_target_router_v490_front110_sector_game.py"
OUT_DIR="${1:-outputs/ring_v490_front110_success_35_145_repro}"

if [[ ! -f "$SCRIPT" ]]; then
  echo "Missing $SCRIPT. Run this from the Dynamic_Gym project root after copying this repo overlay." >&2
  exit 1
fi

mkdir -p "$OUT_DIR"

# v490 representative front-sector successful setup.
export SCREW_RING_COUNT=8
export SCREW_RING_RADIUS=0.90
export SCREW_RING_Z=4.20
export SCREW_ANGLE_MIN_DEG=35
export SCREW_ANGLE_MAX_DEG=145
export SCREW_FRONT110_RELEASE_BIAS_SCALE=1
export SCREW_SUPPRESS_RESETS=1
export SCREW_DIRECT_JOINT_TARGETS=1

"$PYTHON_BIN" "$SCRIPT" \
  --episodes 8 \
  --steps 175 \
  --seed 208031 \
  --num-envs 1 \
  --render-video \
  --video-every 1 \
  --out-dir "$OUT_DIR"

