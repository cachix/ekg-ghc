Provides additional metrics for GHC via `ekg-core`:

- `ghc.threads` - number of threads

## Usage

```haskell

import System.Metrics.GHC (register)
import import System.Metrics (newStore)

main :: IO ()
main = do 
    store <- newStore
    register store
```