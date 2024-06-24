# fecha: 2024-06-23T21-05:00
# autor: Gustavo Castillo
# descripcion: construir Figura 1

# 1. Preparar entorno y cargar datos -----------
rm(list = ls())
gc()
cat('\f')
source("00_packages.R")

# 2. Cargar datos ---------
load(here("01_input",'pnas_light_ineq.RData'))

# 3. Construir Figura 1

# Ejecutar modelo 3 
mod_3 <- lmer(Gini ~ Light_Gini +  
                log(POP) +
                log(GDP) + 
                (1 | Year), 
              data = df_nat)

#Fig 1
visreg(mod_3, 'Light_Gini', gg = T, overlay = T, band = F) + 
  geom_point(size = 2, colour = 'grey') + labs(x = 'Light Gini', y = 'Income Gini')

#los ordenes estan invertidos

spplot(world_2010, c("gini_disp"), col.regions = colorRampPalette(brewer.pal(9, 'YlOrRd'))(20), 
       cuts = 19, col = "grey")

spplot(world_2010, c("light_gini_lpp"), col.regions = colorRampPalette(brewer.pal(9, 'YlOrRd'))(20), 
       cuts = 19, col = "grey")
