## Para hacer
## https://libd.shinyapps.io/SRP009615/

## Primero necesitamos configurar RStudio con
## shinyapps.io. Para eso necesitaremos:
# install.packages("rsconnect")

## También necesitamos verificar que tengamos todos
## los paquetes en versiones nuevas. Eso
## lo podemos hacer con:
# BiocManager::valid()

## Después necesitamos copiar y pegar la información
## de nuestra cuenta (numéro y token de acceso)

## Ahora si ya podemos continuar
options(repos = BiocManager::repositories())

library("recount3")


## URL de recount3
options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

# Meningeal RNAseq data set chosen: SRP118780
## Crear la info del proyecto de forma manual
proj_info <- structure(list(
  project = "SRP118780", organism = "mouse", file_source = "sra",
  project_home = "data_sources/sra", project_type = "data_sources",
  n_samples = 80L
), row.names = 1838L, class = "data.frame")

## Crea un objeto de tipo RangedSummarizedExperiment (RSE)
## con la información a nivel de genes
rse_gene_SRP009615 <- create_rse(proj_info)

## ----"tranform_counts"------------------------------
## Convirtamos las cuentas por nucleotido a cuentas por lectura
## usando compute_read_counts().
## Para otras transformaciones como RPKM y TPM, revisa transform_counts().
assay(rse_gene_SRP009615, "counts") <- compute_read_counts(rse_gene_SRP009615)


## ----"expand_attributes"----------------------------
## Para este estudio en específico, hagamos más fácil de usar la
## información del experimento
rse_gene_SRP009615 <- expand_sra_attributes(rse_gene_SRP009615)

## Crear el sitio web interactivo
iSEE::iSEE(rse_gene_SRP009615)
