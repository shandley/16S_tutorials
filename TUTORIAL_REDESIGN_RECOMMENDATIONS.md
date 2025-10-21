# Tutorial Redesign Recommendations (No Cloud Constraints)

## Current State Analysis

**Strengths to Keep:**
- Clear learning objectives
- Biological question-driven narrative
- Progressive difficulty
- Good balance of explanation and code
- Statistical rigor (PERMANOVA, DESeq2)
- ~90 minute completion time

**Cloud-imposed limitations we can now remove:**
- Memory cleanup code (rm() scattered throughout)
- Fear of showing all samples in plots
- Simplified visualizations to save memory
- Can't explore multiple approaches
- Limited interactive exploration

---

## Core Tutorial Improvements (Same 90-min duration)

### 1. Enhanced Data Exploration (Add 10 min)

**Current:** Basic summary statistics
**Recommended:**

```r
# Interactive data exploration
- Add interactive plotly visualizations (now we have RAM for it)
- Let students filter/subset data themselves
- Show rarefaction curves (memory intensive, now possible)
- Add sample correlation heatmaps
```

**Educational benefit:** Students understand their data before analyzing

---

### 2. Rarefaction Analysis (Add 5 min)

**Currently missing - important for sequencing depth assessment**

```r
# Add section after data quality
- Rarefaction curves by treatment
- Justify not rarefying (or do rarefy if appropriate)
- Educational discussion about rarefaction controversy
```

**Why we couldn't do this before:** Memory intensive with 520 samples

---

### 3. Multiple Beta Diversity Metrics (Add 10 min)

**Current:** Only UniFrac
**Recommended:**

```r
# Compare different distance metrics
- UniFrac (phylogenetic)
- Bray-Curtis (abundance-based)
- Jaccard (presence/absence)
- Side-by-side ordinations
- Discuss when to use which
```

**Educational benefit:** Students learn distances measure different things

---

### 4. Enhanced Differential Abundance (Improve existing section)

**Current:** Only DESeq2, only one comparison
**Recommended:**

```r
# Multiple approaches
- DESeq2 (current)
- Add ANCOM or ALDEx2 for comparison
- Show agreement/disagreement between methods
- Compare multiple treatment pairs (not just Vehicle vs AmpMetro)
```

**Educational benefit:** Learn that method choice matters

---

### 5. Exploratory "Choose Your Own Analysis" (Add 10 min)

**New section after checkpoint 1:**

```r
# Student-driven exploration
- "Pick a treatment comparison that interests you"
- "Which timepoint do you want to focus on?"
- Guided but student-chosen analyses
- Builds engagement
```

**Educational benefit:** Active learning, ownership

---

### 6. Better Visualizations (Throughout)

**Now that we have memory:**

```r
- Animated plots showing change over time (gganimate)
- Interactive 3D PCoA (plotly)
- Heatmaps of top taxa
- Upset plots for shared/unique taxa
- Network visualizations
```

---

## Recommended Modular Structure

### Core Tutorial (90 min) - Current + Improvements Above
**File:** `16S_tutorial_revised.Rmd` (enhanced version)

**Contents:**
1. Introduction & Learning Objectives
2. Data Exploration (enhanced with rarefaction)
3. Alpha Diversity (same)
4. Beta Diversity (multiple metrics)
5. Community Composition (same)
6. Differential Abundance (enhanced with method comparison)
7. Student Choice Section (new)
8. Synthesis & Conclusions
9. Basic Practice Exercises (current 4)

---

### Advanced Module 1: Statistical Deep Dive (45 min)
**File:** `16S_advanced_statistics.Rmd`

**Contents:**
- Repeated measures analysis (same mice over time)
- Linear mixed models with lme4
- Indicator species analysis
- SIMPER analysis (which taxa drive differences)
- Multiple testing correction strategies
- Power analysis

**Prerequisites:** Complete core tutorial
**Learning outcome:** Advanced statistical thinking

---

### Advanced Module 2: Predictive Modeling (60 min)
**File:** `16S_machine_learning.Rmd`

**Contents:**
- Random forest to predict survival from microbiome
- Feature importance (which bacteria matter most)
- Cross-validation
- ROC curves
- Interpretation and caveats
- Connection to causality

**Prerequisites:** Core tutorial
**Learning outcome:** Predictive vs. explanatory modeling

---

### Advanced Module 3: Microbial Ecology (45 min)
**File:** `16S_ecological_analysis.Rmd`

**Contents:**
- Co-occurrence networks
- Ecological null models
- Nestedness analysis
- Beta diversity partitioning
- Source tracking (where do these bacteria come from)

**Prerequisites:** Core tutorial
**Learning outcome:** Ecological thinking

---

### Advanced Module 4: Functional Inference (30 min)
**File:** `16S_functional_prediction.Rmd`

**Contents:**
- PICRUSt2 for functional prediction
- Pathway analysis
- Metabolic potential
- Limitations of 16S for function
- When you need metagenomics

**Prerequisites:** Core tutorial
**Learning outcome:** 16S limitations, next steps

---

### Advanced Module 5: Time Series Analysis (45 min)
**File:** `16S_time_series.Rmd`

**Contents:**
- Trajectory analysis
- Changepoint detection
- Temporal autocorrelation
- Stability metrics
- Recovery dynamics after antibiotics

**Prerequisites:** Core tutorial
**Learning outcome:** Temporal dynamics

---

## Specific Code Improvements for Core Tutorial

### Remove Memory Cleanup
**Current:**
```r
# Clean up ram
rm(ps0)
rm(ps1)
```

**Recommended:** Remove these lines - not needed locally

---

### Add Rarefaction Section

**After Part 2 (Data Quality), add:**

```r
## Rarefaction Analysis

# Generate rarefaction curves
rarecurve(otu_table(ps2), step=100, label=FALSE)

# Calculate rarefaction plateau
# Do we need to rarefy?
# Discussion of pros/cons
```

---

### Enhance Ordination Section

**Current:** One ordination (UniFrac)

**Recommended:**

```r
# Compare multiple distance metrics
distances <- c("unifrac", "wunifrac", "bray", "jaccard")

for(dist in distances) {
  ord <- ordinate(ps2, method="PCoA", distance=dist)
  # Plot and compare
}

# Which metric best separates treatments?
# What does each metric measure?
```

---

### Add Interactive Plots

**Replace static ggplot with plotly where useful:**

```r
# Interactive PCoA - students can hover, zoom, click
library(plotly)
ggplotly(p_beta_treatment)

# Interactive taxonomy barplot
# Students can click to explore specific samples
```

---

### Add Student Choice Section

**After beta diversity:**

```r
## Your Turn: Exploratory Analysis

**Choose one of the following:**

1. Compare a different pair of treatments (e.g., Amp vs Metro)
2. Focus on a specific timepoint (e.g., Day 0 - baseline)
3. Subset to survivors only - what predicts survival?

# Template code provided
# Students modify and explore
```

---

## What NOT to Change

**Keep these as-is:**
1. Clear learning objectives
2. Biological narrative
3. Progressive difficulty
4. Checkpoint structure
5. 90-minute core duration
6. Beginner-friendly explanations
7. Statistical rigor

**Don't add to core:**
- Complex statistics (save for modules)
- Every possible analysis
- Advanced R programming
- Overly technical details

---

## Recommended Implementation Order

### Phase 1: Core Tutorial Enhancements (Week 1)
1. Remove memory cleanup code
2. Add rarefaction section
3. Add multiple beta diversity metrics
4. Enhance visualizations
5. Add student choice section

### Phase 2: Test and Refine (Week 2)
1. Run through entire tutorial locally
2. Time each section
3. Adjust difficulty
4. Add more interpretation prompts

### Phase 3: Create First Advanced Module (Week 3)
**Start with:** Machine Learning module (most engaging)
- Students love prediction
- Clear outcome (predict survival)
- Builds on core tutorial nicely

### Phase 4: Create Additional Modules (Ongoing)
- Add modules based on student interest
- Can be developed over semester
- Each module is standalone

---

## Specific File Structure Recommendation

```
16S_tutorials/
├── 16S_tutorial_revised.Rmd           # Core (enhanced, 90 min)
├── 16S_advanced_statistics.Rmd        # Module 1
├── 16S_machine_learning.Rmd           # Module 2
├── 16S_ecological_analysis.Rmd        # Module 3
├── 16S_functional_prediction.Rmd      # Module 4
├── 16S_time_series.Rmd                # Module 5
├── solutions/
│   ├── core_solutions.Rmd             # Answers to practice exercises
│   ├── advanced_solutions.Rmd         # Answers to advanced modules
└── data/
    ├── 16S_mapping.txt
    └── 16S_tutorial_data.RDS
```

---

## Enhanced Learning Objectives

### Core Tutorial (Revised)
By the end of the core tutorial, students will be able to:

1. **Assess** sequencing depth adequacy using rarefaction curves
2. **Calculate** and **interpret** multiple alpha diversity metrics
3. **Compare** different beta diversity approaches and **justify** metric choice
4. **Perform** ordination and PERMANOVA with **proper interpretation**
5. **Identify** differentially abundant taxa using DESeq2
6. **Compare** results from multiple statistical approaches
7. **Design** and **execute** independent exploratory analyses
8. **Connect** microbiome patterns to biological outcomes
9. **Evaluate** limitations of 16S sequencing

### Advanced Modules (Optional)

**Module 1 (Statistics):**
- Apply mixed models to longitudinal data
- Perform power analysis
- Implement multiple testing corrections

**Module 2 (Machine Learning):**
- Build predictive models from microbiome data
- Interpret feature importance
- Understand prediction vs. causation

**Module 3 (Ecology):**
- Construct and interpret co-occurrence networks
- Apply null model frameworks
- Analyze community assembly processes

**Module 4 (Function):**
- Predict microbial functions from 16S data
- Understand limitations of functional inference
- Know when metagenomics is needed

**Module 5 (Time Series):**
- Analyze temporal dynamics
- Detect changepoints
- Quantify stability and recovery

---

## Sample Enhanced Section: Rarefaction

Here's what a new rarefaction section would look like:

```r
## Assessing Sequencing Depth: Rarefaction Analysis

### What is Rarefaction?

Rarefaction asks: "Have we sequenced deeply enough to capture most of the diversity?"

**The idea:**
- Randomly subsample reads from each sample
- Count how many ASVs are detected
- Repeat at different depths
- Plot curves to see if they plateau

**If curves plateau:** We've sequenced enough
**If curves don't plateau:** More sequencing would find more taxa

### Generate Rarefaction Curves

# Calculate rarefaction curves
rarecurve_data <- rarecurve(
  t(otu_table(ps2)),
  step = 100,
  label = FALSE
)

# Plot by treatment group
# Color curves by treatment to see patterns

### Interpretation

- Do all samples plateau?
- Which treatment groups have lowest diversity?
- Do we need to rarefy (normalize to same depth)?

### The Rarefaction Controversy

**Arguments FOR rarefying:**
- Removes sampling depth bias
- Makes samples comparable

**Arguments AGAINST rarefying:**
- Throws away data
- Reduces statistical power
- Modern methods (DESeq2) handle depth internally

**Our approach:** We won't rarefy because:
1. DESeq2 accounts for library size
2. We want maximum statistical power
3. Our samples have reasonable depth
```

---

## Enhanced Checkpoint Questions

### Checkpoint 1 (Enhanced):

**Take a moment to reflect:**

1. What does rarefaction tell you about your sequencing depth?
2. How do different distance metrics change your interpretation?
3. Which treatment most dramatically altered the microbiome?
4. Can you generate a hypothesis about why certain bacteria were depleted?
5. What would you predict about survival outcomes based on what you've seen?

**Design Your Own Analysis:**
- Choose one comparison you want to explore
- State your hypothesis
- Run the analysis
- Interpret results

---

## Assessment Rubric (For Instructors)

### Core Tutorial Competencies:

**Basic (C):**
- Runs code successfully
- Generates required plots
- Answers interpretation questions

**Proficient (B):**
- Modifies code for different comparisons
- Correctly interprets statistical tests
- Identifies patterns in visualizations

**Advanced (A):**
- Designs independent analyses
- Justifies methodological choices
- Connects findings to biological mechanisms
- Critiques limitations

### Advanced Modules (Optional):

**Completion:**
- Runs module successfully
- Completes exercises

**Mastery:**
- Applies methods to new questions
- Synthesizes across modules
- Proposes extensions

---

## Student Feedback Mechanisms

**Add to tutorial:**

1. **Self-check questions** after each section
   - "Before proceeding, can you explain why we use UniFrac?"

2. **Prediction prompts**
   - "Before running this code, what do you expect to see?"

3. **Error scenarios**
   - "What would happen if we forgot to set a seed?"

4. **Reflection prompts**
   - "How would you explain this plot to a collaborator?"

---

## Data Considerations

### Keep Current Dataset:
- Real published data (authentic)
- Interesting biology (antibiotics + viral infection)
- Multiple treatment groups
- Time series
- Clear outcomes (survival)

### Potential Additions:
- Smaller "practice" dataset for exercises
- Simulated data for null hypothesis testing
- Additional metadata for exploration

---

## Technical Improvements Now Possible

### 1. Better Error Handling

```r
# Add informative error messages
if(!file.exists(here("data", "16S_tutorial_data.RDS"))) {
  stop("Data file not found. Did you open the .Rproj file?")
}
```

### 2. Progress Indicators

```r
# For long-running analyses
library(progress)
pb <- progress_bar$new(total = 100)
# Students see progress during PERMANOVA
```

### 3. Interactive Parameter Exploration

```r
# Let students adjust parameters
# e.g., alpha diversity threshold slider
# Now we have RAM for reactivity
```

### 4. Reproducibility Features

```r
# Session info at end
# Package versions
# System information
# Easy troubleshooting
```

---

## Recommended Next Steps

### Immediate (This Week):

1. **Review current tutorial** - identify memory cleanup code to remove
2. **Add rarefaction section** - important and now feasible
3. **Test enhanced beta diversity** - multiple metrics side-by-side

### Short-term (Next 2 Weeks):

4. **Create student choice section** - boost engagement
5. **Enhance visualizations** - interactive where useful
6. **Write first advanced module** - machine learning (most exciting)

### Medium-term (This Semester):

7. **Test with students** - get feedback
8. **Iterate based on feedback**
9. **Add 2-3 more advanced modules**
10. **Create solutions/answer keys**

### Long-term (Next Semester):

11. **Publish tutorial materials** - share with community
12. **Workshop at conference** - Evomics, STAMPS, etc.
13. **Create video walkthroughs**
14. **Build online course**

---

## Questions to Consider

1. **How much time do you have with students?**
   - One 3-hour session? Keep core only
   - Full week workshop? Add modules
   - Semester course? All modules + projects

2. **What's your class size?**
   - Small (<20): More interaction, live coding
   - Large (>50): More structured, less live debugging

3. **What's the next course?**
   - Is this standalone or part of sequence?
   - Do students continue with their own data?

4. **What are student backgrounds?**
   - Pure biology: Keep explanations simple
   - Bioinformatics: Can go deeper technically
   - Mixed: Provide optional advanced sections

---

## My Specific Recommendations for You

### Core Tutorial Changes:

**High Priority (Do First):**
1. ✅ Remove memory cleanup code
2. ✅ Add rarefaction section
3. ✅ Add Bray-Curtis alongside UniFrac
4. ✅ Add student choice section (10 min)

**Medium Priority:**
5. Add interactive plotly visualizations
6. Compare DESeq2 with one other method (ANCOM-BC)
7. Add more "pause and predict" prompts

**Low Priority (Nice to Have):**
8. Animated time series plots
9. Network visualization
10. 3D ordination

### Advanced Modules Priority:

**Create First:**
- Machine Learning (most engaging, clear outcome)

**Create Second:**
- Time Series (leverages your dataset well)

**Create Third:**
- Statistical Deep Dive (for quantitative students)

**Create Later:**
- Functional Prediction
- Ecological Analysis

---

## Would You Like Me To:

1. **Create enhanced core tutorial** - with rarefaction, multiple distances, student choice section
2. **Create first advanced module** - machine learning for survival prediction
3. **Both** - enhanced core + ML module
4. **Something else** - tell me what would be most useful

I can start implementing any of these improvements immediately!
