#!/usr/bin/env bash

# get_ecoli_NGS.sh ---> Download paired-end E. coli NGS data from SRA

# Exit on error
set -euo pipefail

# SRA accession
SRR="SRR2584863"

# Output directory
OUTDIR="../data/raw"

# Create output directory if it doesn't exist
mkdir -p "${OUTDIR}"

# Download paired-end FASTQ files
fasterq-dump --split-files "${SRR}" -O "${OUTDIR}"

# List downloaded files
echo "Downloaded files:"
ls -lh "${OUTDIR}/${SRR}"*.fastq

