# Student Setup Instructions - Local R/RStudio

## What You Need

- R (version 4.0 or higher)
- RStudio
- Internet connection (for one-time package installation)

**Time required:** 15-20 minutes (mostly waiting for packages to install)

---

## Step 1: Download the Tutorial Files

1. Go to: **https://github.com/shandley/16S_tutorials**

2. Click the green **"Code"** button

3. Click **"Download ZIP"**

4. Save the ZIP file to a location you'll remember (e.g., Downloads, Desktop, Documents)

5. **Unzip the file:**
   - Windows: Right-click → "Extract All"
   - Mac: Double-click the ZIP file

   You should now have a folder called `16S_tutorials-main`

---

## Step 2: Open the Project in RStudio

1. **Open RStudio**

2. Go to: **File → Open Project...**

3. Navigate to the `16S_tutorials-main` folder you just unzipped

4. Select the file **`16S_tutorials.Rproj`**
   - If you don't see a `.Rproj` file, that's okay - just use File → Open and select the folder

5. RStudio will open with this as your working directory

---

## Step 3: Install Required Packages

**IMPORTANT:** You only need to do this ONCE on your computer.

### Option A: Use the Setup Script (Easiest)

In the RStudio **Console** (bottom left pane), type:

```r
source("setup_packages.R")
```

Press Enter and wait 10-15 minutes while packages install. You'll see lots of text - this is normal!

### Option B: Manual Installation

If the script doesn't work, install packages manually:

```r
# Step 1: Install BiocManager
install.packages("BiocManager")

# Step 2: Install CRAN packages (wait for each to finish)
install.packages("tidyverse")
install.packages("vegan")
install.packages("ggpubr")
install.packages("gridExtra")

# Step 3: Install Bioconductor packages
BiocManager::install("phyloseq")
BiocManager::install("DESeq2")
```

---

## Step 4: Verify Data Files Are Present

In the Console, type:

```r
list.files("data")
```

You should see:
```
[1] "16S_mapping.txt"       "16S_tutorial_data.RDS"
```

If you see these two files, you're ready!

---

## Step 5: Open the Tutorial

1. In RStudio's **Files** pane (bottom right), click on **`16S_tutorial_revised.Rmd`**

2. The tutorial will open in the editor (top left pane)

3. You're ready to start!

---

## How to Work Through the Tutorial

### Running Code Chunks

You'll see gray boxes with code - these are called "chunks". To run them:

- **Click the green arrow** on the right side of each chunk, OR
- **Press Ctrl+Shift+Enter** (Windows) or **Cmd+Shift+Return** (Mac)

### Tips

- **Run chunks in order** - don't skip around
- **Wait for each chunk to finish** before running the next one
- **Read the text** between chunks - it explains what's happening
- **Don't panic if you see warnings** - warnings are okay, errors are not

### Saving Your Work

- **Auto-save:** RStudio auto-saves your file
- **Manual save:** Click the save icon or Ctrl+S (Cmd+S on Mac)
- **Create HTML report:** Click the **"Knit"** button at the top
  - This creates a nice HTML file with all your results

---

## Troubleshooting

### Problem: "Package X is not installed"

**Solution:** Run the setup script again or install the missing package:
```r
install.packages("package_name")
# OR for phyloseq/DESeq2:
BiocManager::install("package_name")
```

### Problem: "Cannot find file"

**Solution:** Make sure you opened the `.Rproj` file in Step 2. This sets your working directory correctly.

Check where you are:
```r
getwd()  # Should show path ending in "16S_tutorials-main"
```

### Problem: "Cannot open the connection" when loading data

**Solution:** Make sure data files are in the `data/` folder:
```r
list.files("data")
```

If they're not there, you may have extracted the ZIP incorrectly. Try downloading and extracting again.

### Problem: R crashes or freezes

**Solution:**
- Close RStudio
- Reopen RStudio
- Open the project again
- Reload packages (run the `load-libraries` chunk)
- Continue where you left off

---

## What to Do During Class

1. **Have RStudio open** with the tutorial file
2. **Follow along** as the instructor demonstrates
3. **Run chunks** when instructed
4. **Ask questions** if you get errors
5. **Save often** (Ctrl+S / Cmd+S)

---

## After Class

- Your work is saved in the `.Rmd` file
- Your plots and results are in RStudio
- To create a final report: Click **"Knit"** button
  - This creates an HTML file you can submit or share

---

## System Requirements

**Minimum:**
- 4 GB RAM
- 2 GB free disk space
- R version 4.0+
- RStudio version 2022.07+

**Recommended:**
- 8 GB RAM
- 5 GB free disk space
- Latest R and RStudio versions

---

## Getting Help

**During installation:**
- Installation errors are normal - try restarting and installing again
- Some packages take a long time - be patient
- If a package fails repeatedly, ask your instructor

**During the tutorial:**
- Read error messages carefully
- Check you ran previous chunks first
- Restart R if things get weird: Session → Restart R

**Can't figure it out?**
- Ask a classmate
- Ask your instructor
- Check the error message on Google/Stack Overflow

---

## FAQs

**Q: Do I need a GitHub account?**
A: No! Just download the ZIP file.

**Q: Do I need to install git?**
A: No!

**Q: How long does package installation take?**
A: 10-20 minutes depending on your internet speed and computer.

**Q: Do I need to install packages every time?**
A: No! Only once. After that, you just load them with `library()`.

**Q: Can I work on this on multiple computers?**
A: Yes, but you'll need to install packages on each computer (one-time setup per computer).

**Q: Will this work on Mac/Windows/Linux?**
A: Yes! The tutorial works on all platforms.

**Q: What if I already have some packages installed?**
A: The setup script checks and only installs missing packages. Won't reinstall what you have.

---

## Quick Reference Card

**Download tutorial:**
https://github.com/shandley/16S_tutorials → Code → Download ZIP

**Install packages (one time):**
```r
source("setup_packages.R")
```

**Open tutorial:**
File → Open Project → select `16S_tutorials.Rproj`
Then open `16S_tutorial_revised.Rmd`

**Run a chunk:**
Click green arrow or Ctrl+Shift+Enter

**Save work:**
Ctrl+S (Cmd+S on Mac)

**Create report:**
Click "Knit" button

**Restart R:**
Session → Restart R

**Get help:**
Ask instructor or classmate

---

Good luck! You're going to learn how the gut microbiome influences viral infection outcomes!
