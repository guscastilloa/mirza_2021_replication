cat(version$version.string)
paquetes <- c(
  # Básicos
  "here",
  "tidyverse",
  "rio",
  "janitor",
  # Econometría
  "fixest",
  "lme4",
  "modelsummary",
  "visreg",
  # Modelos Estadísticos
  "MuMIn",
  # Diagramas
  "visreg",
  "ggplot2",
  "RColorBrewer"
)


# Instalar paquetes usando librería "pacman" ---------------------------------
if(!require(pacman)){install.packages(pacman); library(pacman)}
p_load(paquetes, character.only = T)











# Instalar paquetes usando "base R" -------------------------------------------
for (i in 1:length(paquetes)){
  if(!require(paquetes[i], character.only = T)){
    install.packages(paquetes[i])
    } else {
    library(paquetes[i], character.only = T)
    }
}

# utils::sessionInfo()