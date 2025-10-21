# Instructor Setup Guide for Posit Cloud

## Quick Setup for Shared Posit Cloud Project

This is the simplest approach for teaching - you set everything up once, students just click and go.

### Step 1: Create Your Base Project

1. **Log in to Posit Cloud** (posit.cloud)
2. **Create a new project** from Git Repository
   - URL: `https://github.com/shandley/16S_tutorials`
3. **Wait for the project to clone**

### Step 2: Organize Data Files

In the R Console:
```r
# Create data directory
dir.create("data", showWarnings = FALSE)

# Move data files
file.rename("16S_mapping.txt", "data/16S_mapping.txt")
file.rename("16S_tutorial_data.RDS", "data/16S_tutorial_data.RDS")

# Verify
list.files("data")
```

You should see:
```
[1] "16S_mapping.txt"       "16S_tutorial_data.RDS"
```

### Step 3: Install All Packages (One Time)

**Method A: Use the setup script (easiest)**
```r
source("setup_packages.R")
```
Wait 5-10 minutes for installation.

**Method B: Manual installation**
```r
# Install BiocManager
install.packages("BiocManager")

# Install CRAN packages
install.packages(c("tidyverse", "vegan", "ggpubr", "gridExtra"))

# Install Bioconductor packages
BiocManager::install(c("phyloseq", "DESeq2"))
```

### Step 4: Test the Tutorial

1. Open `16S_tutorial_revised.Rmd`
2. Run the first few code chunks to verify everything works
3. Test knitting to HTML (optional but recommended)

### Step 5: Share with Students

**Option A: Share Project Link (Easiest)**

1. Click the gear icon (Project Options) in top right
2. Go to "Access"
3. Change to "Everyone" or "Specific People"
4. Copy the project URL
5. Share the URL with students
6. Students click the URL and choose "Make a Permanent Copy"

**Option B: Create a Posit Cloud Space**

1. Create a Space (Workspace) for your class
2. Invite students to the Space
3. Save your project in that Space
4. Students can create derived copies

### Step 6: Update Tutorial (If Needed)

If you make changes to the GitHub repo and want to update:

```bash
# In Terminal
git pull origin main
```

Then tell students to create new copies from your updated project.

---

## Student Instructions (What to Tell Them)

### Simple Instructions for Students:

1. **Click the Posit Cloud link** provided by your instructor
2. **Click "Make a Permanent Copy"** (or "Save a Permanent Copy")
3. Wait for the project to copy (~30 seconds)
4. **Open `16S_tutorial_revised.Rmd`**
5. **Click "Run All"** or run chunks individually
6. That's it!

**Students do NOT need to:**
- Install any packages
- Clone from GitHub
- Set up data directories
- Run setup scripts

Everything is ready to go!

---

## Troubleshooting

### Issue: Students see "Package not installed" errors

**Cause:** Student created a new project instead of copying yours

**Solution:** Make sure they click "Make a Permanent Copy" of YOUR project, not create a new one

### Issue: Data files not found

**Cause:** Data files aren't in the `data/` directory

**Solution:**
```r
# Check file locations
list.files()
list.files("data")

# If files are in root, move them
dir.create("data", showWarnings = FALSE)
file.rename("16S_mapping.txt", "data/16S_mapping.txt")
file.rename("16S_tutorial_data.RDS", "data/16S_tutorial_data.RDS")
```

### Issue: Memory warnings on Posit Cloud

**Cause:** Free tier has 1GB RAM limit

**Solutions:**
- This tutorial should work fine within limits
- Avoid running too many chunks at once
- Restart R session if needed: Session → Restart R
- Upgrade to Plus tier if needed ($5/month)

### Issue: Session timeout

**Cause:** Free tier projects sleep after 1 hour of inactivity

**Solution:**
- Work is auto-saved
- Click to wake up project
- Continue where you left off

---

## For Advanced Users: renv Setup

If you want maximum reproducibility with exact package versions:

```r
# Initialize renv in your base project
renv::init()

# Install all packages (they'll be tracked)
source("setup_packages.R")

# Take snapshot
renv::snapshot()

# Students automatically get the same versions when they copy
```

This creates `renv.lock` file with exact package versions.

---

## Memory Management Tips

The tutorial is designed for Posit Cloud free tier (1GB RAM), but here are tips to avoid issues:

1. **Don't run all chunks at once** - Run sequentially
2. **Clear environment periodically:**
   ```r
   # Remove large objects you don't need
   rm(ps0, ps1)
   gc()  # Garbage collection
   ```
3. **Restart R if needed:** Session → Restart R
4. **The tutorial already includes cleanup** - Objects are removed when no longer needed

---

## Project Structure

Your final shared project should look like:

```
/cloud/project/
├── 16S_tutorial_revised.Rmd        # Main tutorial (students use this)
├── README.md                        # Project overview
├── setup_packages.R                 # Installation script (for reference)
├── PACKAGE_MANAGEMENT.md            # Package guide (for reference)
├── REVISION_SUMMARY.md              # Design notes (for reference)
├── original_16S_tutorial.txt        # Old version (for reference)
└── data/
    ├── 16S_mapping.txt              # Sample metadata
    └── 16S_tutorial_data.RDS        # Phyloseq object
```

---

## Quick Reference: Package Installation Commands

If you ever need to reinstall packages manually:

```r
# CRAN packages
install.packages("tidyverse")
install.packages("vegan")
install.packages("ggpubr")
install.packages("gridExtra")

# Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("phyloseq")
BiocManager::install("DESeq2")

# Verify
library(phyloseq)
library(tidyverse)
library(vegan)
library(DESeq2)
library(ggpubr)
library(gridExtra)
```

---

## Time Estimates

- **Your setup time:** 15-20 minutes (one time)
- **Student setup time:** 30 seconds (just copy project)
- **Tutorial completion:** 60-90 minutes
- **Total class time needed:** 90 minutes recommended

---

## Tips for Teaching

1. **Start with data exploration** - Build intuition before statistics
2. **Use the checkpoints** - Two built-in stopping points for discussion
3. **Encourage experimentation** - Students can't break anything (they have their own copy)
4. **Practice exercises** - Four exercises at the end for homework
5. **Knit to HTML** - Students can download their results

---

## Getting Help

- **Tutorial issues:** Check GitHub issues
- **Posit Cloud issues:** help.posit.co
- **R package issues:** Usually fixed by restarting R session

---

## Cost

**Posit Cloud Free Tier:**
- 25 project hours/month
- 1 GB RAM
- 1 CPU
- Usually sufficient for this tutorial

**Posit Cloud Plus ($5/month):**
- More RAM and CPU
- Longer project hours
- Consider for larger classes
