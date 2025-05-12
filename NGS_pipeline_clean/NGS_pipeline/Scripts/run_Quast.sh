#!/usr/bin/env bash

# runQuast.sh ---> Evaluate assembly quality using QUAST

set -euo pipefail

# Input and output paths
ASSEMBLY="../results/ecoli_assembly/contigs.fasta"
OUTDIR="../results/quast_report"

# Create output directory
mkdir -p "${OUTDIR}"

# Run QUAST
quast.py "${ASSEMBLY}" -o "${OUTDIR}" --threads 4

echo "QUAST analysis complete. See: ${OUTDIR}/report.html"

