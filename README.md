The `justified-containers` test suite had a change in behavior between GHC 8.0.2 and GHC 8.2.1.
Certain values that were supposed to occupy the same location in memory are now distinct.
This is my attempt at understanding the change.

With `stack` installed, run `make both` to see the behavior change.

It seems that the change in behavior was introduced by this commit to `ghc`: https://github.com/ghc/ghc/commit/f0d98fc6cdde26bf43a04d9f01b6ad2f4c88f0b9#diff-95e107ab36c9beadfc459f7118eb03f8
