The `justified-containers` test suite had a change in behavior between GHC 8.0.2 and GHC 8.2.1.
Certain values that were supposed to occupy the same location in memory are now distinct.
This is my attempt at understanding the change.

With `stack` installed, run `make both` to see the behavior change.