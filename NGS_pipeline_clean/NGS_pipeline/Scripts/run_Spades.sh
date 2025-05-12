#!/usr/bin/env bash

# run_Spades.sh ---> Assemble E. coli reads using SPAdes (assembler-only mode)

set -euo pipefail

# Input files
R1="../data/trimmed/paired/ecoli_R1_paired.fastq"
R2="../data/trimmed/paired/ecoli_R2_paired.fastq"

# Output directory
OUTDIR="../results/ecoli_assembly"

# Clean previous results
rm -rf "${OUTDIR}"
mkdir -p "${OUTDIR}"

# Run SPAdes without error correction
spades.py \
  --only-assembler \
  -1 "${R1}" \
  -2 "${R2}" \
  -o "${OUTDIR}" \
  --careful \
  -t 4

echo "Assembly complete. Results in ${OUTDIR}"

