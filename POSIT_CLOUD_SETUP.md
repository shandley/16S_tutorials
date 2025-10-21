# Posit Cloud Setup Instructions

## Initial Setup (First Time)

### Method 1: New Project from Git Repository

1. Log in to Posit Cloud (posit.cloud)
2. Click "New Project" → "New Project from Git Repository"
3. Enter the repository URL: `https://github.com/shandley/16S_tutorials`
4. Click "OK" and wait for the project to be created

### Method 2: Clone in Terminal

1. Create a new Posit Cloud project
2. Open the Terminal tab
3. Run:
   ```bash
   git clone https://github.com/shandley/16S_tutorials.git
   cd 16S_tutorials
   ```

## Updating an Existing Project (Pulling New Changes)

If you've already created the project and need to get the latest updates from GitHub:

### Option 1: Using the Terminal (Recommended)

1. In your Posit Cloud project, click on the "Terminal" tab
2. Navigate to the project directory if needed:
   ```bash
   cd /cloud/project
   ```
3. Pull the latest changes:
   ```bash
   git pull origin main
   ```
4. You should see output showing which files were updated

### Option 2: Using Git Panel in RStudio

1. Look for the "Git" tab in the top-right pane
2. Click the blue "Pull" button (down arrow)
3. Review the changes that were pulled

### Option 3: Fresh Start

If you want to completely start over:

1. Create a new project from the Git repository (see "Initial Setup" above)
2. Delete the old project

## After Pulling Updates

Once you have the latest code:

1. **Organize data files** (if not already done):
   ```r
   # Create data directory
   dir.create("data", showWarnings = FALSE)

   # Move data files (if they're in the root directory)
   file.rename("16S_mapping.txt", "data/16S_mapping.txt")
   file.rename("16S_tutorial_data.RDS", "data/16S_tutorial_data.RDS")
   ```

2. **Install packages** (first time only):
   ```r
   source("setup_packages.R")
   ```
   This takes 5-10 minutes.

3. **Verify setup**:
   ```r
   # Check that data files are in the right place
   list.files("data")
   # Should show: "16S_mapping.txt" "16S_tutorial_data.RDS"

   # Check that packages are installed
   library(phyloseq)
   library(tidyverse)
   # If no errors, you're ready!
   ```

4. **Open the tutorial**:
   - Click on `16S_tutorial_revised.Rmd` in the Files pane
   - Click "Knit" or run chunks interactively

## Common Issues and Solutions

### Issue: "git pull" fails with merge conflicts

If you've modified files locally and they conflict with GitHub updates:

```bash
# Save your changes
git stash

# Pull the updates
git pull origin main

# Reapply your changes (if desired)
git stash pop
```

Or, to completely discard local changes:
```bash
# WARNING: This deletes your local changes
git reset --hard origin/main
```

### Issue: Data files aren't in the right location

The tutorial expects data files in `/cloud/project/data/`. If you see errors about missing files:

```r
# Check current location of data files
list.files(pattern = "16S")

# If they're in the root directory, move them:
dir.create("data", showWarnings = FALSE)
file.rename("16S_mapping.txt", "data/16S_mapping.txt")
file.rename("16S_tutorial_data.RDS", "data/16S_tutorial_data.RDS")

# Verify
list.files("data")
```

### Issue: Packages won't install

Try installing packages one at a time to identify the problem:

```r
# Install one package at a time
install.packages("tidyverse")
install.packages("vegan")
install.packages("ggpubr")
install.packages("gridExtra")

# Then Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("phyloseq")
BiocManager::install("DESeq2")
```

### Issue: "Could not find function" errors

Restart R and reload packages:
1. Session → Restart R
2. Re-run the library loading code chunk

## Project Structure

After setup, your project should look like this:

```
/cloud/project/
├── 16S_tutorial_revised.Rmd        # Main tutorial
├── README.md                        # Project overview
├── REVISION_SUMMARY.md              # Tutorial design notes
├── PACKAGE_MANAGEMENT.md            # Package installation guide
├── POSIT_CLOUD_SETUP.md            # This file
├── setup_packages.R                 # Automated package installer
├── original_16S_tutorial.txt        # Original tutorial (reference)
├── .gitignore                       # Git ignore rules
└── data/
    ├── 16S_mapping.txt              # Sample metadata
    └── 16S_tutorial_data.RDS        # Phyloseq object
```

## For Instructors: Setting Up a Shared Workspace

To set up a workspace where students can copy a pre-configured project:

1. **Create a Posit Cloud Space** (Workspace)
2. **Create the base project** in that space:
   - New Project from Git Repository
   - URL: `https://github.com/shandley/16S_tutorials`
3. **Set up the project**:
   - Create `data/` directory
   - Move data files
   - Run `setup_packages.R` to pre-install packages
4. **Make it a base project**:
   - Project Settings → Access → Set appropriate permissions
5. **Students join the space** and **copy/derive** from the base project
   - They get all packages pre-installed
   - Saves 5-10 minutes per student

## Checking for Updates

To see if there are new updates on GitHub:

```bash
# Check for updates without pulling
git fetch origin main

# See what's new
git log HEAD..origin/main --oneline

# If there are updates, pull them
git pull origin main
```

## Getting Help

If you encounter issues:

1. Check `PACKAGE_MANAGEMENT.md` for package installation help
2. Check file paths match the tutorial expectations
3. Restart R session and try again
4. Ask your instructor or open a GitHub issue

## Tips for Working in Posit Cloud

1. **Save frequently** - Posit Cloud auto-saves, but click the save icon to be sure
2. **Projects sleep after inactivity** - Your work is saved, but it takes a moment to wake up
3. **Free tier limits** - 1 GB RAM, 1 CPU. This tutorial runs fine within these limits.
4. **Don't re-install packages** - Once installed, just load them with `library()`
5. **Use relative paths** - The tutorial uses `/cloud/project/data/` which always works
