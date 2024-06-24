# fecha: 2024-06-23T21-05:00
# autor: Gustavo Castillo
# descripcion: construir Figura 3

# 1. Preparar entorno y cargar datos -----------
rm(list = ls())
gc()
cat('\f')
source("00_packages.R")

# 2. Cargar datos ---------
load(here("01_input",'pnas_light_ineq.RData'))

# 3. Construir Figura 3

#Fig 3
spplot(US_states_10, c("Estimate..Gini.Index"), par.settings=list(fontsize=list(text=20)), 
       col.regions = colorRampPalette(brewer.pal(9, 'Reds'))(50), cuts = 49, col = "transparent")

spplot(US_states_10, c("light_gini"), par.settings=list(fontsize=list(text=20)),
       col.regions = colorRampPalette(brewer.pal(9, 'Reds'))(50), cuts = 49, col = "transparent")

spplot(US_county, c("Estimate..Gini.Index"), par.settings=list(fontsize=list(text=20)),
       col.regions = colorRampPalette(brewer.pal(9, 'Reds'))(50), cuts = 49, col = "transparent")

cor.test(~ light_gini + Gini, df_US_states[year != 2005])

ggplot(df_US_states[year != 2005], aes(light_gini, Gini)) + geom_point() + 
  geom_smooth(method = 'lm', se = F) + labs(x = 'Light Gini', y = 'Income Gini')

