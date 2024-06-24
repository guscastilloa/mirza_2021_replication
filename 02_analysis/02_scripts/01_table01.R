# fecha: 2024-06-23T21-05:00
# autor: Gustavo Castillo
# descripcion: construir tabla 1

# 1. Preparar entorno y cargar datos -----------
rm(list = ls())
gc()
cat('\f')
source("00_packages.R")

# 2. Cargar datos ---------
load(here("01_input",'pnas_light_ineq.RData'))

#Table 1

mod_1 <- lmer(Gini ~ Light_Gini + 
                (1 | Year), 
              data = df_nat)
summary(mod_1)
r.squaredGLMM(mod_1)[2]
AIC(mod_1)
AICc(mod_1)

mod_2 <- lmer(Gini ~ Light_Gini +  
                log(POP) +
                (1 | Year), 
              data = df_nat)
summary(mod_2)
r.squaredGLMM(mod_2)[2]
AIC(mod_2)
AICc(mod_2)


mod_3 <- lmer(Gini ~ Light_Gini +  
                  log(POP) +
                  log(GDP) + 
                  (1 | Year), 
                data = df_nat)
summary(mod_3)
r.squaredGLMM(mod_3)[2]
AIC(mod_3)
AICc(mod_3)

mod_4 <- lm(Gini ~ Light_Gini +  
                log(POP) +
                log(GDP), 
              data = df_nat)
summary(mod_4)



require("modelsummary")
modelsummary(list(mod_1,mod_2,mod_3,mod_4), "html")

#"html"
#"markdown
#modelsummary(models, output = "table.docx")

modelsummary(list(mod_1,mod_2,mod_3,mod_4), fmt=2, "html")
modelsummary(list(mod_1,mod_2,mod_3,mod_4), 
             fmt=2,
             estimate  = "{estimate}{stars} ({std.error})",
             statistic=NULL,
             stars = c('***' = .001, '**' = .05,"*" =0.1), 
             "html")






#alternative specification
require("fixest")

mod1<-feols(Gini ~ Light_Gini | Year,df_nat)
mod2<-feols(Gini ~ Light_Gini +  log(POP)  | Year,df_nat)
mod3<-feols(Gini ~ Light_Gini +  log(POP) + log(GDP) | Year,df_nat)
mod4<-feols(Gini ~ Light_Gini  +  log(POP) + log(GDP) ,df_nat)

etable(mod1,mod2,mod3,mod4)