#!/usr/bin/env bash

# trim.sh ---> Quality trim paired-end E. coli reads using Trimmomatic

# Exit on error
set -euo pipefail

# Input files
IN1="../data/raw/SRR2584863_1.fastq"
IN2="../data/raw/SRR2584863_2.fastq"

# Output directories
OUT_DIR="../data/trimmed"
PAIRED="${OUT_DIR}/paired"
UNPAIRED="${OUT_DIR}/unpaired"

# Create output directories
mkdir -p "${PAIRED}" "${UNPAIRED}"

# Output files
OUT_P1="${PAIRED}/ecoli_R1_paired.fastq"
OUT_UP1="${UNPAIRED}/ecoli_R1_unpaired.fastq"
OUT_P2="${PAIRED}/ecoli_R2_paired.fastq"
OUT_UP2="${UNPAIRED}/ecoli_R2_unpaired.fastq"

# Adapter path (paired-end version!)
ADAPTERS="/Users/emilykoehler/miniconda3/share/trimmomatic-0.39-2/adapters/TruSeq3-PE.fa"

# Run Trimmomatic in PE mode
trimmomatic PE \
  -threads 1 \
  -phred33 \
  "${IN1}" "${IN2}" \
  "${OUT_P1}" "${OUT_UP1}" \
  "${OUT_P2}" "${OUT_UP2}" \
  ILLUMINACLIP:${ADAPTERS}:2:30:10 \
  LEADING:20 \
  TRAILING:20 \
  SLIDINGWINDOW:4:30 \
  MINLEN:36

echo "Trimming complete."
echo "Paired reads: ${OUT_P1}, ${OUT_P2}"
echo "Unpaired reads: ${OUT_UP1}, ${OUT_UP2}"

