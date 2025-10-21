# ============================================================================
# 16S Tutorial: Package Installation Script
# ============================================================================
#
# Purpose: Install all required R packages for the 16S microbiome tutorial
#
# Instructions:
# 1. Open this file in RStudio/Posit Cloud
# 2. Run the entire script (Ctrl/Cmd + Shift + Enter)
# 3. Wait for all packages to install (may take 5-10 minutes)
# 4. Once complete, you can run the tutorial
#
# Note: You only need to run this ONCE per Posit Cloud project
# ============================================================================

# Display session info
cat("Current R version:", R.version.string, "\n\n")

# Function to install packages if not already installed
install_if_missing <- function(packages) {
  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      cat("Installing package:", pkg, "\n")
      install.packages(pkg, dependencies = TRUE)
    } else {
      cat("Package already installed:", pkg, "\n")
    }
  }
}

# Function to install Bioconductor packages
install_bioc_if_missing <- function(packages) {
  # Install BiocManager if needed
  if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }

  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      cat("Installing Bioconductor package:", pkg, "\n")
      BiocManager::install(pkg, update = FALSE)
    } else {
      cat("Bioconductor package already installed:", pkg, "\n")
    }
  }
}

cat("===============================================\n")
cat("STEP 1: Installing CRAN packages\n")
cat("===============================================\n\n")

# CRAN packages
cran_packages <- c(
  "tidyverse",    # Data manipulation and visualization
  "vegan",        # Ecological statistics and PERMANOVA
  "ggpubr",       # Publication-ready plots with statistics
  "gridExtra"     # Arranging multiple plots
)

install_if_missing(cran_packages)

cat("\n===============================================\n")
cat("STEP 2: Installing Bioconductor packages\n")
cat("===============================================\n\n")

# Bioconductor packages
bioc_packages <- c(
  "phyloseq",     # Microbiome data analysis
  "DESeq2"        # Differential abundance testing
)

install_bioc_if_missing(bioc_packages)

cat("\n===============================================\n")
cat("STEP 3: Verifying installations\n")
cat("===============================================\n\n")

# Verify all packages load correctly
all_packages <- c(cran_packages, bioc_packages)
success <- TRUE

for (pkg in all_packages) {
  if (require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("✓", pkg, "loaded successfully\n")
  } else {
    cat("✗", pkg, "FAILED to load\n")
    success <- FALSE
  }
}

cat("\n===============================================\n")
if (success) {
  cat("SUCCESS! All packages installed correctly.\n")
  cat("You can now run the 16S tutorial.\n")
} else {
  cat("ERROR: Some packages failed to install.\n")
  cat("Please check the error messages above.\n")
  cat("You may need to restart R and try again.\n")
}
cat("===============================================\n")

# Display session info for troubleshooting
cat("\nSession Information:\n")
sessionInfo()
