# Espresso - Error Suppression through Contextual Signature Integration

Traditional variant calling methods utilize variant allele frequency (VAF) cutoffs to call variants. These cutoffs are often set arbitrarily and the measure becomes problematic when trying to call at variants at low VAFs, where true biological variation becomes hard to distinguish from sequencing error. The 'Espresso' package employs a novel variant calling approach that models sequencing error distributions across 192 trinucleotide  contexts and conducts variant calling by comparing each putative variant to its corresponding contextual error distribution. This demonstrates superior sensitivity and specificity over existing variant calling methods and bolsters our ability to accurately distinguish signal from noise at very low VAFs.



# Installation

Some Espresso dependencies are from bioconductor and not CRAN, so you may need to install these extra packages first:

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("BiocGenerics", "BSgenome.Hsapiens.UCSC.hg19", "BSgenome.Hsapiens.UCSC.hg38", "VariantAnnotation", "GenomicScores", "maftools", "cellbaseR"))
```

To install Espresso, open R and install directly from github using the following commands: 

```
library(devtools)
install_github("abelson-lab/Espresso")
```

To annotate variants with minor allele frequencies, download the appropriate [MafDB annotation package](https://bioconductor.org/packages/3.8/data/annotation/).

```
# gnomAD exomes release 2.1 - hg19 
BiocManager::install(c("MafDb.gnomADex.r2.1.hs37d5"))

### For MAF annotation from other databases (1Kgenomes, ExAc, etc) or specific to the GRCh38 reference, see link above
```


### Alternative installation 
If install_github is not working (newer versions of devtools may have issues with the formatting of the DESCRIPTION file), then try: 
```
library(remotes); install_url(url="https://github.com/abelson-lab/Espresso/archive/master.zip", INSTALL_opt= "--no-multiarch")
```



# Workflow

Espresso takes in files generated by VarScan through the pileup2cns command, which generates one pileup file for each sample and includes all positions that met a minimum coverage. This way, Espresso leverages miscalled alleles generated by sequencing error in order to generate context specific error models and call low-VAF variants with more confidence. 

Here is an R notebook outlining the Espresso variant calling workflow:
[Espresso Workflow](https://htmlpreview.github.io/?https://github.com/abelson-lab/Espresso/blob/master/vignettes/Espresso_workflow.nb.html)
