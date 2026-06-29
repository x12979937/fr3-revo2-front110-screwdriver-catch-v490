# FR3 + Revo2 Front-110 Screwdriver Catch v490

This repository packages the `v490` front-sector falling screwdriver catch demo for the
Dynamic_Gym Isaac Gym FR3 + Revo2 setup.

## What This Contains

- `scripts/run_ring_drop_screwdriver_motion_target_router_v490_front110_sector_game.py`
  - The controller/motion-target script used for the v490 run.
- `assets/generated/falling_screwdriver_affordance_v01/`
  - The generated screwdriver/tool URDF and mesh used by the run.
- `outputs/ring_v490_front110_success_35_145/`
  - The successful v490 output: CSV rows, JSON summary, per-episode summary, and mp4 video.
- `run_v490_front110_success_demo.sh`
  - A helper wrapper for replaying the same 8-angle representative demo inside the
    Dynamic_Gym project environment.

## Verified v490 Result

Output directory:

```text
outputs/ring_v490_front110_success_35_145
```

The recorded run succeeded on 8 representative angles in the front `[35 deg, 145 deg]`
sector:

```text
105, 45, 55, 75, 35, 125, 145, 90 deg
```

Summary:

```text
successes: 8
success_rate: 1.0
ring_radius: 0.9 m
release_z: 4.2 m
```

Video:

```text
outputs/ring_v490_front110_success_35_145/falling_ring_screwdriver_catch_v490_seed208031.mp4
```

## Important Scope Note

This is the v490 representative-angle success package. It is not the later strict
continuous-uniform `[35 deg,145 deg]` validation package. In particular, the v490 run
demonstrates eight selected front-sector angles and includes the behavior/configuration
used in that successful run.

## Expected Base Environment

This package is an overlay for the existing project:

```text
Dynamic_Gym-sim-env-franka-revo2-aerial-v1
```

The target environment used during development had:

- Isaac Gym Python environment
- `isaacgym`, `isaacgymenvs`, `torch`, `hydra`, `omegaconf`, `imageio`
- the task configs/classes already present in Dynamic_Gym

The script imports:

```text
SimToolRealFallingBatonV89FrankaBrainCoRevo2SequentialSpindleCatch
SimToolRealDynamicGraspV33FrankaBrainCoRevo2AffordanceDomino20PointNetPPO
```

so those Dynamic_Gym task/config definitions must exist in the host project.

## How To Reproduce Inside Dynamic_Gym

From the Dynamic_Gym project root, copy or keep this repo's `scripts/` and `assets/`
directories at the project root, then run:

```bash
bash run_v490_front110_success_demo.sh
```

If your Isaac Gym Python path differs, set:

```bash
export ISAACGYM_PYTHON=/path/to/isaacgym_py38/bin/python
```

If your project uses a custom environment bootstrap, source it before running:

```bash
source /path/to/screw_v196_env.sh
bash run_v490_front110_success_demo.sh
```

## Robot/Object Specs Recorded In The Result

The summary JSON records:

- FR3 joint velocity limits:
  `[2.62, 2.62, 2.62, 2.62, 5.26, 4.18, 5.26]` rad/s
- Revo2 active joint order:
  `[thumb_flex, thumb_aux, index, middle, ring, pinky]`
- Revo2 active joint velocity limits:
  `[2.53, 2.62, 2.27, 2.27, 2.27, 2.27]` rad/s
- Tool shape:
  30 mm diameter, lightweight tool-like object with a positive handle region and
  negative functional region.

