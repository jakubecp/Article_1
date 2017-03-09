rm(list = ls())

jrdata <- read.csv2("data/jr_data.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
jrdata

str(jrdata)
pocet <- jrdata$POCET_TOT[jrdata$ZEME=="Czech Republic"]
mes <- as.factor (jrdata$MES_POC[jrdata$ZEME=="Czech Republic"])
fdata <- data.frame(mes,pocet)
str(fdata)
plot(fdata$mes,fdata$pocet)
hist(fdata$mes)
mod1 <- glm(fdata$pocet~fdata$mes, family = poisson)
mod2 <- glm(fdata$pocet~fdata$mes, family = gaussian)
mod3 <- glm(fdata$pocet~fdata$mes, family = inverse.gaussian)
AIC(mod1,mod2, mod3)
anova(mod3)
summary(mod3)

