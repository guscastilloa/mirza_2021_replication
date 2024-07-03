# fecha: 2024-07-03T17:19-05:00
# autor: Gustavo Castillo
# descripcion: desempacar el RData y exportar adecuadamente

# 1. Preparar entorno y cargar datos -----------
rm(list = ls())
gc()
cat('\f')
source("00_packages.R")

# 2. Cargar datos ---------
load(here("01_input",'pnas_light_ineq.RData'))

# 3. Modificar objetos de tipo Spatial PolygonsDataFrame ----
US_states_10_out <- sf::st_as_sf(US_states_10) 
world_2010_out <- sf::st_as_sf(world_2010) 

# 3. Exportar ----
export(df_nat, 
       file = here("../01_build/03_output/df_nat.csv") )
export(df_US_states, 
       file = here("../01_build/03_output/df_US_states.csv") )
export(swiid_df, 
       file = here("../01_build/03_output/swiid_df.csv") )
sf::st_write(US_states_10_out, 
             here("../01_build/03_output/US_states_10.geojson"))
sf::st_write(world_2010_out, 
             here("../01_build/03_output/world_2010.geojson"))
