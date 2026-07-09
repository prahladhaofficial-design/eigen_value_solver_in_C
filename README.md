# Eigenvalue Solver in C

A compact numerical linear algebra project pairing C source code with LaTeX and Markdown mathematical documentation.

## Overview

Eigenvalue computation is a core numerical linear algebra operation used in optimization, PCA, stability analysis, and scientific computing.
This repository keeps the implementation and derivation close together so the numerical routine can be reviewed from both an engineering and mathematical perspective.

## Project Design

- Keep the C implementation small and focused.
- Preserve the mathematical explanation in editable LaTeX.
- Include a Markdown copy of the technical document for easier GitHub reading.
- Use a Makefile-oriented build flow where supported.

## Key Capabilities

- C implementation for eigenvalue-related computation.
- LaTeX technical write-up with supporting style files.
- Markdown version of the derivation for direct repository viewing.
- Simple build workflow for local compilation.

## Repository Structure

```text
src/eigen.c   Core C source file.
main.tex      Editable LaTeX technical document.
docs/main.md  Markdown technical document.
Makefile      Build helper.
gvv*.sty      LaTeX style files.
```

## Running Locally

```bash
make
gcc src/eigen.c -o eigen
./eigen
```

## Results and Artifacts

- Compiled executable after local build.
- Technical derivation available in both LaTeX and Markdown.
- Small source layout suitable for extending into a larger numerical methods library.

## Reproducibility Notes

- Compile src/eigen.c with gcc or the included Makefile before reviewing runtime behavior.
- Keep the Markdown and LaTeX derivations synchronized when changing mathematical notation.
- Run the executable from the repository root so relative paths, if added later, remain predictable.
- Treat generated binaries as local build artifacts and avoid committing them.

## Detailed Workflow

- Start from `docs/main.md` to understand the mathematical setup.
- Read `src/eigen.c` to inspect how the computation is expressed in C.
- Build the program with `make` where available.
- If Make is unavailable, compile the C file directly with `gcc`.
- Compare the program behavior with the derivation in the technical document.

## Implementation Details

- The C source is intentionally compact so numerical steps remain visible.
- The LaTeX document is kept editable for mathematical refinement.
- The Markdown document makes the same explanation easier to read on GitHub.
- The Makefile keeps build commands close to the source.
- The repository layout is simple enough to extend with additional numerical routines.

## Data and Inputs

- The current project does not depend on a large dataset.
- Inputs can be extended through hardcoded matrices, command-line values, or external files.
- Future test matrices should include known eigenvalues so correctness can be checked automatically.

## How To Interpret the Results

- Use the C output to verify the numerical procedure.
- Use the LaTeX/Markdown notes to connect code steps with matrix theory.
- Use small matrices first when extending the solver, since they are easier to verify manually.
- Compare results with a trusted numerical package when adding new routines.

## Limitations and Assumptions

- The project is a compact numerical implementation, not a full-featured linear algebra library.
- Numerical stability checks should be added before using it on difficult matrices.
- Input parsing and automated tests are natural next steps.
- The build workflow assumes a local C compiler is available.


## Review Guide

Use this checklist when reviewing the repository on GitHub:

- Start with the overview to understand the project objective before opening notebooks or source files.
- Read the repository structure section to identify the main entry point.
- Inspect generated outputs before rerunning experiments; they provide a quick view of the current project state.
- Review scripts and notebooks together when both are present, since notebooks often explain decisions while scripts preserve reusable execution paths.
- Check the limitations section before interpreting results too strongly.
- Use the possible extensions section to understand how the project can grow without changing its core purpose.

## Troubleshooting

Common issues and fixes:

- If imports fail, confirm that the virtual environment is activated and dependencies were installed from `requirements.txt`.
- If a notebook cell fails because a variable is missing, restart the kernel and run the notebook from the first cell.
- If a script cannot find a data file, run it from the repository root unless the README gives a different working directory.
- If plots are not regenerated, check that the output folder exists and that the script has write permission.
- If a package version causes errors, create a fresh environment and reinstall dependencies before debugging the source code.
- If GPU-related packages are unavailable, run CPU-compatible sections first and treat heavier deep-learning experiments separately.

## Development Notes

The repository is organized to be understandable before it is optimized. Most code favors clear structure, visible intermediate steps, and saved artifacts over highly compressed implementations. When extending the project, prefer small changes that keep the original experiment reproducible.

Recommended development practices:

- Keep new data files under `data/`, `datasets/`, or the existing local data folder for that project.
- Keep generated figures under `figures/`, `plots/`, `outputs/`, or `results/` depending on the existing convention.
- Add new experiments as separate scripts or clearly labeled notebook sections.
- Avoid overwriting existing outputs unless the experiment is intentionally being refreshed.
- Document any new dependency in `requirements.txt`.
- Prefer relative paths so the repository works after cloning on another machine.

## Project Status

This repository is prepared as a standalone GitHub project. The current version includes the core implementation, documentation, and available artifacts needed to understand the work. Future improvements can focus on stronger automation, more tests, richer visual summaries, and cleaner packaging where appropriate.

## Possible Extensions

- Add matrix input through files or command-line arguments.
- Add test matrices with known eigenvalues.
- Add numerical tolerance checks and error reporting.
- Document time complexity and numerical stability concerns.

## Tech Stack

C, Make, LaTeX, Markdown.

## Author

Prahladha, IIT Hyderabad
