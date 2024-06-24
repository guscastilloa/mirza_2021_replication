# fecha: 2024-06-23T21-05:00
# autor: Gustavo Castillo
# descripcion: construir Figura 2

# Cargar datos
load(here("01_input",'pnas_light_ineq.RData'))

#Fig 2
ggplot(data = swiid_df, aes(income_cat, light_gini_lpp)) + 
  geom_boxplot(colour = 'darkblue', fill = 'lightblue', size = 1) +
  labs(x = 'Income Group', y = 'Light Gini') +
  theme_minimal(base_size = 20) + xlim(c('High Income', 'Low Income', 'Middle Income'))

ggplot(data = swiid_df, aes(income_cat, gini_disp)) + 
  geom_boxplot(colour = 'darkblue', fill = 'lightblue', size = 1) +
  labs(x = 'Income Group', y = 'Income Gini') +
  theme_minimal(base_size = 20) + xlim(c('High Income', 'Low Income', 'Middle Income'))

ggplot(data = swiid_df, aes(region, light_gini_lpp)) + 
  geom_boxplot(colour = 'red4', fill = 'indianred1', size = 1) +
  labs(x = 'Regions', y = 'Light Gini') +
  theme_minimal(base_size = 20) 

ggplot(data = swiid_df, aes(region, gini_disp)) + 
  geom_boxplot(colour = 'red4', fill = 'indianred1', size = 1) +
  labs(x = 'Regions', y = 'Income Gini') +
  theme_minimal(base_size = 20) 

