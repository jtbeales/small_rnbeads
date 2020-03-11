FROM r-base:3.6.3

RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    ghostscript

# Add the Bioconductor installer and install the base packages
RUN R -e 'if (!requireNamespace("BiocManager")) {install.packages("BiocManager")};\
          BiocManager::install()'

# Add DESeq2 dependencies from Bioconductor
RUN R -e 'install.packages(c("pheatmap", "fastcluster"), repo = "https://cloud.r-project.org")'

# # Add DESeq2 from Bioconductor and other packages
RUN R -e 'BiocManager::install(c("apeglm", \
                                 "BiocParallel", \
                                 "DESeq2", \
                                 "DEGreport", \
                                 "vsn", \
                                 "RnBeads", \
                                 "goseq", \
                                 "EnsDb.Hsapiens.v86", \
                                 "org.Hs.eg.db", \
                                 "Rsubread")\
                               )'
