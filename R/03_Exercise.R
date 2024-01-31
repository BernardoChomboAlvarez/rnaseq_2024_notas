# Code part
## Lets build our first SummarizedExperiment object
library("SummarizedExperiment")
## ?SummarizedExperiment

## De los ejemplos en la ayuda oficial

## Creamos los datos para nuestro objeto de tipo SummarizedExperiment
## para 200 genes a lo largo de 6 muestras
nrows <- 200
ncols <- 6
## Números al azar de cuentas
set.seed(20210223)
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)
logcounts <- log10(counts)
## Información de nuestros genes
## Create data
rowRanges <- GenomicRanges::GRanges(
  rep(c("chr1", "chr2"), c(50, 150)),
  IRanges::IRanges(floor(runif(200, 1e5, 1e6)), width = 100),
  strand = sample(c("+", "-"), 200, TRUE),
  feature_id = sprintf("ID%03d", 1:200)
)
names(rowRanges) <- paste0("gene_", seq_len(length(rowRanges)))
## Información de nuestras muestras
colData <- DataFrame(
  Treatment = rep(c("ChIP", "Input"), 3),
  row.names = LETTERS[1:6]
)
## Juntamos ahora toda la información en un solo objeto de R
rse <- SummarizedExperiment(
  assays = SimpleList(counts = counts,
                      logcounts = log2(counts + 0.5)),
  rowRanges = rowRanges,
  colData = colData
)

## Exploremos el objeto resultante
rse

## Comando 1
rse[1:2, ]
# class: RangedSummarizedExperiment
# dim: 2 6
# metadata(0):
#   assays(1): counts
# rownames(2): gene_1 gene_2
# rowData names(1): feature_id
# colnames(6): A B ... E F
# colData names(1): Treatment

## Comando 2
rse[, c("A", "D", "F")]
# class: RangedSummarizedExperiment
# dim: 200 3
# metadata(0):
#   assays(1): counts
# rownames(200): gene_1 gene_2 ... gene_199 gene_200
# rowData names(1): feature_id
# colnames(3): A D F
# colData names(1): Treatment

