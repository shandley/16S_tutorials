# Package Management Guide

This document explains different approaches for managing R packages in this tutorial, from beginner to advanced.

## Overview

This tutorial requires several R packages. Choose the approach that best fits your needs and experience level.

## Option 1: Simple Setup Script (Recommended for Beginners)

**Best for:** First-time users, students with 2-3 days R experience

### Steps:

1. Open `setup_packages.R` in RStudio/Posit Cloud
2. Run the entire script: `Ctrl/Cmd + Shift + Enter`
3. Wait 5-10 minutes for installation
4. Start the tutorial

**Advantages:**
- Simple, one-time setup
- Educational - explains what each package does
- Provides clear error messages
- Works perfectly on Posit Cloud free tier

**Script includes:**
```r
source("setup_packages.R")
```

## Option 2: Interactive Installation (Educational)

**Best for:** Learning about package management

The tutorial itself includes a smart loading function that will tell you exactly what to install if packages are missing. Just start the tutorial and follow the error messages.

**How it works:**
1. Open `16S_tutorial_revised.Rmd`
2. Try to run the first code chunk
3. If packages are missing, you'll get clear instructions like:
   ```
   Package 'phyloseq' is not installed.
   Please run the setup_packages.R script first, or install with:
   BiocManager::install('phyloseq')
   ```

**Advantages:**
- Learn by doing
- Understand package dependencies
- Clear feedback

## Option 3: Manual Installation

**Best for:** Experienced R users who want control

### Install CRAN packages:
```r
install.packages(c(
  "tidyverse",
  "vegan",
  "ggpubr",
  "gridExtra"
))
```

### Install Bioconductor packages:
```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("phyloseq", "DESeq2"))
```

## Option 4: Using renv (Advanced - Full Reproducibility)

**Best for:** Reproducible research, collaboration, publication

### Initial setup (instructor/first user):
```r
# Initialize renv in the project
renv::init()

# Install all packages as normal
source("setup_packages.R")

# Take a snapshot of installed packages
renv::snapshot()
```

This creates:
- `renv.lock` - Exact versions of all packages
- `renv/` directory - Private package library

### Restore environment (students/collaborators):
```r
# Automatically restore the exact package versions
renv::restore()
```

**Advantages:**
- Exact reproducibility
- Isolated project library (doesn't affect other projects)
- Records package versions for publication
- Easy to share with collaborators

**Disadvantages:**
- More complex for beginners
- Requires additional disk space
- Longer initial setup

## Package List

### CRAN Packages:
| Package | Purpose | Size |
|---------|---------|------|
| tidyverse | Data manipulation & visualization | ~90 MB |
| vegan | Ecological statistics (PERMANOVA) | ~5 MB |
| ggpubr | Statistical plot annotations | ~3 MB |
| gridExtra | Multi-panel plots | ~1 MB |

### Bioconductor Packages:
| Package | Purpose | Size |
|---------|---------|------|
| phyloseq | Microbiome data analysis | ~15 MB |
| DESeq2 | Differential abundance testing | ~20 MB |

**Total disk space needed:** ~135 MB

**Installation time:**
- Posit Cloud: 5-10 minutes
- Local (with fast internet): 3-5 minutes
- Local (slow internet): 10-20 minutes

## Troubleshooting

### Problem: "package 'X' is not available"

**Solution 1:** Check package name spelling
**Solution 2:** Update R version (some packages require R ≥ 4.0)
```r
R.version.string  # Check your version
```

### Problem: BiocManager::install() fails

**Solution:** Install BiocManager first
```r
install.packages("BiocManager")
```

### Problem: "compilation failed for package 'X'"

**Solution 1:** Install binary instead of source (Posit Cloud does this automatically)
**Solution 2:** Check system dependencies (usually not needed on Posit Cloud)

### Problem: Out of memory during installation

**Solution:** Install packages one at a time instead of all at once
```r
install.packages("tidyverse")
# Wait for completion, then:
install.packages("vegan")
# etc.
```

### Problem: Packages install but won't load

**Solution:** Restart R session
- RStudio: Session → Restart R
- Posit Cloud: Session → Restart R

## Best Practices for Students

1. **Run setup once:** Only install packages once per project/computer
2. **Don't reinstall:** If packages are already installed, just load them with `library()`
3. **Check before installing:** The tutorial checks for you!
4. **Ask for help:** If setup fails, don't spend hours troubleshooting - ask your instructor

## For Instructors

### Pre-installing packages on Posit Cloud

**Option A: Shared workspace**
1. Create a Posit Cloud workspace
2. Install packages once in the base project
3. Students copy/derive from this project
4. Packages are already installed!

**Option B: Dockerfile/container**
1. Create a custom Docker image with packages
2. Configure Posit Cloud to use this image
3. Students start with packages pre-installed

**Option C: Installation during class**
1. Have students run `setup_packages.R` at start of session
2. Use this time to introduce package management concepts
3. Discuss what's happening while packages install

### Teaching moments:

- **Why package management matters:** Different versions can give different results
- **CRAN vs Bioconductor:** Different repositories for different types of packages
- **Dependencies:** Packages depend on other packages (tree structure)
- **Reproducibility:** Recording versions ensures others can replicate your work

## Version Information

This tutorial was developed and tested with:

```
R version 4.3.0 (2023-04-21)
Platform: x86_64-pc-linux-gnu (64-bit)

Key package versions:
- phyloseq 1.44.0
- DESeq2 1.40.0
- tidyverse 2.0.0
- vegan 2.6-4
```

To see your package versions:
```r
sessionInfo()
```

## Additional Resources

- [R Packages book](https://r-pkgs.org/) by Hadley Wickham
- [Bioconductor installation guide](https://www.bioconductor.org/install/)
- [renv documentation](https://rstudio.github.io/renv/)
- [Posit Cloud guide](https://posit.cloud/learn/guide)
