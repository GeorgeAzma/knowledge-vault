go to python project folder and create new rust project via `maturin`
project name must not have `<space>` or `<dash>`
``` bash
# for building rust lib for python
pip install maturin
# setup virtual environment
python -m venv .env
.env/scripts/activate
# create new rust project
maturin new tokenizer
cd tokenizer
# compiles in release mode and installs
maturin develop -r
```
### Rust
`tokenizer/Cargo.toml`
``` toml
[lib]
# in python: import tokenizer
# should match name of #[pymodule]
name = "tokenizer"
crate-type = ["cdylib"]

[dependencies]
pyo3 = { version = "0.23.1", features = ["extension-module"] }
```
`tokenizer/src/lib.rs`
``` rust
use pyo3::prelude::*;

#[pyclass]
struct Tokenizer;

#[pymethods]
impl Tokenizer {
    #[new]
    fn new() -> Self { Self }
}

#[pyfunction]
fn tokenize(text: &str) -> PyResult<String> {
    Ok(text.to_string())
}

#[pymodule]
fn tokenizer(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_class::<Tokenizer>()?;
    m.add_function(wrap_pyfunction!(tokenize, m)?)?;
    Ok(())
}
```
### Linting
`tokenizer/src/tokenizer.pyi` required for syntax higlighting and comments
`note: you don't need to 'maturin develop' if you change this`
``` python
def tokenize(text: str) -> str:
    """
    tokenizes text
    Args:
        text (int or float): to be tokenized
    Returns:
        tokens (str): tokenized text
    """
# for only function definition, no comments
# def tokenize(text: str) -> str: ...
```
