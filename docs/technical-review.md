# Technical review

| Finding | Evidence / consequence |
|---|---|
| FA measurement fails | `.mt0` says `failed`; listing says trigger was not reached. With the period-based eight-row vector, A rises at 40 ns, not after the 60 ns measurement delay. |
| CLA16 B15 connection is wrong | Last instance repeats B12 in the B15 position. The listing warns that B15 cannot be found. |
| CLA input amplitude differs from supply | CLA vectors use VIH = 1 V, but the circuit operates at 1.8 V. |
| CLA contains duplicate transient commands | Both `.tran 1p 80n` and `.tran 1p 100n` remain in the archived deck. The scalar result is printed twice. |
| Top-level vector connects to wrong bus | VNAME A/B drives input-DFF output nets; the DFF data pins A_in/B_in are undriven. The listing has 16 no-DC-path warnings. |
| Configured frequency is not fmax | Clock is 1 GHz; operands update every 10 ns. No validated clock-to-Q, worst-case combinational delay, setup/hold budget, or frequency sweep is present. |
| Storage timing numbers are stimulus offsets | The pulse schedules bracket the nominal edge, but no automated setup/hold boundary characterization is saved. |
| Clock edges are not zero in the executed solver | HSPICE warns that zero clock rise/fall times are replaced by tstep. |
| Vector inputs have no explicit slope | Delay listings show nonzero time from the scheduled change to threshold crossing. |
| No expected output declarations | All saved vector files are input-only. They do not provide automatic arithmetic output comparisons. |
| Internal final adder uses four CLA4 blocks | Carries propagate serially between blocks; this is not one global 16-bit lookahead stage. |
| Multiplier timing covers one saved event | 707.0566 ps is the A0-to-M15 measurement for F9 × FF after zero operands. It is not an exhaustive critical delay. |
| Supply sources are local to gate subcircuits | Any new power accounting must consider all relevant supplies, not a single assumed global source. |

No valid complete theoretical bound was recomputed from the failed FA timing result or the defective standalone CLA experiment. The internal multiplier's arithmetic wiring was instead checked independently with ideal primitives across all 65,536 pairs. That result does not validate transistor-level primitives or synchronous timing.

Original decks retain electrical statements, vector contents, and trailing `.endl` directives. Packaging changes only include paths and filenames. Compact scalar outputs and diagnostic listing lines are retained; numerical text claiming a successful FA delay is not used in place of the saved failure. No fresh HSPICE run was performed.
