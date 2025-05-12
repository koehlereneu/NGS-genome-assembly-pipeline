# NGS-genome-assembly-pipeline

This project implements a short-read genome assembly pipeline using publicly available Illumina paired-end reads of *Escherichia coli*. It automates key steps from data retrieval to assembly quality evaluation using bioinformatics tools.

## Project Structure
NGS_pipeline/
├── Scripts/ # Bash scripts for each pipeline step
├── data/ # Raw and trimmed FASTQ files
├── results/ # SPAdes assembly output and QUAST reports
└── README.md # This file

## Workflow Overview
1. **Download NGS reads** from NCBI SRA using `fasterq-dump`
2. **Trim reads** using `Trimmomatic`
3. **Assemble genome** using `SPAdes`
4. **Evaluate assembly** with `QUAST`


## Tools Used
| Step        | Tool            |
|-------------|-----------------|
| Data download   | `fasterq-dump` (SRA Toolkit) |
| Quality trimming| `Trimmomatic` |
| Genome assembly | `SPAdes` v3.15.2 |
| Assembly QC     | `QUAST` v5.3.0 |


## How to Run
Each step is scripted for reproducibility:

```bash
# 1. Download raw reads
bash Scripts/get_ecoli_NGS.sh

# 2. Trim reads
bash Scripts/trim.sh

# 3. Assemble genome
bash Scripts/run_Spades.sh

# 4. Evaluate with QUAST
bash Scripts/run_Quast.sh

