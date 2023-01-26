> 🚧 This document is under construction!
# ProVal Development Standards Rubric

This is the general grading guide for auditing content developed by the Development team. The grading process goes as follows:

1. When beginning the audit, all categories have their maximum value.
2. If a deviation from standards is detected, a review on that deviation will commence.
3. If the deviation is verified, then a point will be deducted from that category. Severe deviations may warrant additional point loss.
4. After the audit is completed, the remaining points are tallied and the score logged for that audit.

A deviation is detected when the auditor thinks that a part of code or documentation is not following the standards outlined in this repo. Verification of that deviation is required by referencing a specific section of the standards that were violated in the notes of the audit.

## Rubric
|                   | Functionality | Validation | Composition | Readability | Security | Language Specific | *Total* |
| ----------------: | :-----------: | :--------: | :---------: | :---------: | :------: | :---------------: | :-----: |
|          **Code** |      0-5      |    0-5     |     0-5     |     0-5     |   0-5    |       0-10        |  0-35   |
| **Documentation** |       -       |     -      |     0-5     |     0-5     |   0-5    |         -         |  0-15   |
|               --- |               |            |             |             |          |                   |         |
|  *Possible Score* |      0-5      |    0-5     |    0-10     |    0-10     |   0-10   |       0-10        |  0-50   |

|                  Deviation                  |            Verification            |
| :-----------------------------------------: | :--------------------------------: |
| Short explanation of the possible deviation | Reference to the standard violated |

## Categories
Explanations of the different grading categories can be found in this repo:

- [Functionality](CODE.md#functionality)
- [Validation](CODE.md#validation)
- [Readability](CODE.md#readability)
- [Security](CODE.md#security)
- Language Specific
  - [Powershell](powershell/)
    - [Code](powershell/CODE.md)
    - [Documentation](powershell/DOCUMENTATION.md)
