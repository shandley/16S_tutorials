# 16S rRNA Gene Amplicon Analysis Tutorial

A comprehensive tutorial for analyzing bacterial microbiome data using R and the phyloseq package.

## Overview

This tutorial uses real published data from Thackray et al. (2018) to teach students how to analyze 16S rRNA gene amplicon sequencing data. The tutorial explores how antibiotic treatment affects the gut microbiome and influences West Nile Virus infection outcomes in mice.

## Learning Objectives

Students will learn to:
- Explore and assess quality of 16S amplicon datasets
- Calculate and interpret alpha diversity metrics
- Perform beta diversity analysis using ordination and PERMANOVA
- Visualize microbial community composition
- Identify differentially abundant taxa using DESeq2
- Connect microbiome patterns to biological outcomes

## Target Audience

This tutorial is designed for biology students with 2-3 days of training in:
- UNIX basics
- R programming
- tidyverse data manipulation
- ggplot2 visualization

## Tutorial Duration

- Core material: 60-75 minutes
- With practice exercises: 90+ minutes

## Data Files

- `16S_tutorial_data.RDS` - Phyloseq object containing ASV counts, taxonomy, and phylogenetic tree
- `16S_mapping.txt` - Sample metadata including treatment groups, timepoints, and survival outcomes

## Tutorial Files

- `16S_tutorial_revised.Rmd` - Main tutorial R Markdown document
- `REVISION_SUMMARY.md` - Detailed documentation of tutorial design

## Required R Packages

```r
# Core analysis
library(phyloseq)
library(vegan)
library(DESeq2)

# Data manipulation and visualization
library(tidyverse)
library(ggpubr)
library(gridExtra)
library(here)  # Smart file paths
```

See `PACKAGE_MANAGEMENT.md` for detailed installation instructions and options.

## Quick Start for Students

**No git or GitHub account required!**

1. **Download:** Click the green "Code" button above → "Download ZIP"
2. **Extract:** Unzip the downloaded file
3. **Open:** Double-click `16S_tutorials.Rproj` to open in RStudio
4. **Install packages (one time):** In RStudio Console, run:
   ```r
   source("setup_packages.R")
   ```
5. **Start tutorial:** Open `16S_tutorial_revised.Rmd` and begin!

**See `STUDENT_INSTRUCTIONS.md` for detailed step-by-step guide.**

## For Instructors

### Setup

**One-time setup on your computer:**
```r
# Clone or download this repository
# Install all packages
source("setup_packages.R")
```

### Sharing with Students

**Easiest method:** Have students download ZIP (no git needed)
- Students go to GitHub repo URL
- Click "Code" → "Download ZIP"
- Extract and open `.Rproj` file
- Run `setup_packages.R`

**Alternative:** Institutional RStudio Server
- See `INSTRUCTOR_SETUP.md` for Posit Cloud setup (not recommended for free tier)
- Check with your IT department for institutional RStudio Server

## File Organization

```
16S_tutorials/
├── 16S_tutorial_revised.Rmd        # Main tutorial
├── 16S_tutorials.Rproj             # RStudio project file
├── setup_packages.R                # One-time package installation
├── STUDENT_INSTRUCTIONS.md         # Step-by-step student guide
├── INSTRUCTOR_SETUP.md             # Instructor setup guide
├── README.md                       # This file
└── data/
    ├── 16S_mapping.txt             # Sample metadata
    └── 16S_tutorial_data.RDS       # Phyloseq object
```

## Data Source

Data are from:

Thackray LB, et al. (2018). Oral Antibiotic Treatment of Mice Exacerbates the Disease Severity of Multiple Flavivirus Infections. Cell Reports, 22(13):3440-3453.
https://www.ncbi.nlm.nih.gov/pubmed/29590614

## Tutorial Structure

1. Introduction and Learning Objectives
2. Data Exploration
3. Data Quality Assessment and Cleaning
4. Alpha Diversity Analysis
5. Beta Diversity Analysis with PERMANOVA
6. Community Composition Visualization
7. Differential Abundance Testing with DESeq2
8. Connection to Survival Outcomes
9. Synthesis and Conclusions
10. Practice Exercises

## Key Features

- Biological question-driven narrative
- Progressive skill building
- Statistical testing with proper interpretation
- Publication-quality visualizations
- Real-world published dataset
- Practice exercises for independent learning

## License

This tutorial is provided for educational purposes. Please cite the original data source (Thackray et al. 2018) when using this material.

## Author

Scott A. Handley

## Support

For questions or issues, please open a GitHub issue in this repository.
