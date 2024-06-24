# fecha: 2024-06-23T21-05:00
# autor: Gustavo Castillo
# descripcion: construir Figura 4

# 1. Preparar entorno y cargar datos -----------
rm(list = ls())
gc()
cat('\f')
source("00_packages.R")

# 2. Cargar datos ---------
load(here("01_input",'pnas_light_ineq.RData'))

# 3. Construir Figura 4



# Fig 4
# Use data at https://github.com/muhusmanmirza/PNAS_light_inequality to plot the static window inequality maps for 1990, 1995, 2000, 2005 & 2010 
# Use data https://zenodo.org/record/4635734/files/gini_2010.tif?download=1 to plot the smoothed version for 2010. 

