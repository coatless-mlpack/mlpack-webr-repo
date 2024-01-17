# webR Version of mlpack R Bindings

Custom repository containing the {mlpack} R bindings compiled to webR/R WASM

## Usage

In webR, install the `mlpack` package by using:

```r
webr::install("mlpack", repos = "https://coatless-mlpack.github.io/mlpack-webr-repo/")
```

## Example

You can find the example script run in [test-mlpack-webr-r-bindings.R](test-mlpack-webr-r-bindings.R).

For best results, we suggest running the script in the [webR REPL Editor pinned to v0.2.2 of webR](https://webr.r-wasm.org/v0.2.2/).