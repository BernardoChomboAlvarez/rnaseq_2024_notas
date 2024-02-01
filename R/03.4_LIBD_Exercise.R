library("iSEE")

## Descarguemos unos datos de spatialLIBD
sce_layer <- spatialLIBD::fetch_data("sce_layer")
iSEE::iSEE(sce_layer)

# Results in /figures folder
