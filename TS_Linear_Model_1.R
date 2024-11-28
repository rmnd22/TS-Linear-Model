
library("openxlsx")
library("readxl")
library("zoo")
library("tidyverse")
library("dplyr")
library("graphics")
library("ggplot2")
library("foreign")
library("moments")
library("haven")
library("lmtest")
library("dynlm")
library("tseries")
library("urca")
library("Hmisc")
library("vars")
library("carData")
library("car")

wd <- "C:/Users/ArmandoTorres/OneDrive - KEO World/Escritorio/Base_Datos_Dipl_ModXII_2024_LS.xlsx"
ACT_IND_MEX <- read_excel(wd, sheet = "act_ind_mex")

attach(ACT_IND_MEX)
Periodo <- ts(Periodo,frequency = 4, start = c(1993,1))
ai <- ts(ai,frequency = 4, start = c(1993,1))
y <- ts(y,frequency = 4, start = c(1993,1), end = c(2024,2))
inf <- ts(inf,frequency = 4, start = c(1993,1))
ied <- ts(ied,frequency = 4, start = c(1993,1))
r <- ts(r,frequency = 4, start = c(1993,1))
## Análisis estadístico y gráfico de las variables: 

variables <- c("ai","y","inf","ied","r")

medias <-c(
mean(ai),
mean(y),
mean(inf),
mean(ied),
mean(r)
)

varianzas <- c(
round(var(ai),digits = 2),
round(var(y),digits = 2),
round(var(inf),digits = 2),
round(var(ied),digits = 2),
round(var(r),digits = 2)
)

desviaciones <- c(
sd(ai),
sd(y),
sd(inf),
sd(ied),
sd(r)
)

simetrias <- c(
skewness(ai, na.rm = FALSE),
skewness(y, na.rm = FALSE),
skewness(inf, na.rm = FALSE),
skewness(ied, na.rm = FALSE),
skewness(r, na.rm = FALSE)
)

kurtos <- c(
kurtosis(ai, na.rm = FALSE),
kurtosis(y, na.rm = FALSE),
kurtosis(inf, na.rm = FALSE),
kurtosis(ied, na.rm = FALSE),
kurtosis(r, na.rm = FALSE)
)

# Mientras mas cercana este a cero la kurtois, menos rezago tiene, una 
# kurtosis = 0 es una distribución normal

dat <- data.frame(variables, medias, desviaciones, simetrias, kurtos)
dat[,2:5] <- round(dat[,2:5], digits = 2)
dat

cor(ACT_IND_MEX[,c("ai","inf", "r")])

par(mfrow=c(1,3))

ts.plot(ai, main="Total de Actividad Industrial: 1993-2024")
#ts.plot(y, main="PIB en Mexico: 1993-2024")
ts.plot(inf, main="Inflación trimestral en Mexico: 1993-2024")
#ts.plot(ied, main="Inversión extranjera a Mexico: 1993-2024")
ts.plot(r, main="Tasa de interés en Mexico: 1993-2024")

hist(ai, main="Histograma del Total de Actividad Industrial")
#hist(y, main="Histograma del PIB en México")
hist(inf, main="Histograma de la Inflación trimestral en Mexico")
#hist(ied, main="Histograma de la Inversión extranjera a Mexico")
hist(r, main="Histograma de la Tasa de Interés en Mexico")

## Estimar pruebas de raíces unitarias ADF a las variables en niveles:

# ai

summary(ur.df(ai, type=c("trend"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que -2.94 no es menor que el valor crítico
summary(ur.df(ai, type=c("drift"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que -2.11 no es menor que el valor crítico
summary(ur.df(ai, type=c("none"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que 1.5002 no es menor que el valor crítico

# No podemos rechazar la hipotesis nula de raiz unitaria en ninguna prueba
# La serie no es estacionaria en niveles, sugiere  diferenciar la serie

# y
  summary(ur.df(y, type=c("trend"), lags = 8, selectlags=c("BIC")))
  # Dado que -3.45 si es menor que el valor critico al 5%, rechazamos hipotesis
  # de raiz unitaria. y estacionaria con tendencia en el modelo
  summary(ur.df(y, type=c("drift"), lags = 8, selectlags=c("BIC")))
  # No estacionario ya que -1.16 no es menor que el valor crítico, no se rechaza
  # hipotesis nula sin tendencia, con solo una constante
  summary(ur.df(y, type=c("none"), lags = 8, selectlags=c("BIC")))
  # No es estacionaria ya que 3.42 no es menor que el valor critico, no se rechaza
  # hipotesis nula cuando sin tendencia ni constante
  
  # Cuando se incluye una tendencia, la serie y parece ser estacionaria.
  # Sin embargo, cuando se modela con solo un drift o sin ningún componente 
  # determinístico (ni constante ni tendencia), la serie no es estacionaria.
  
  # Sugiere diferenciar la serie para hacerla estacionaria sin incluir 
  # tendencia o constante.

# inf

summary(ur.df(inf, type=c("trend"), lags = 8, selectlags=c("BIC")))
# Dado que -3.91 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. y estacionaria con tendencia en el modelo
summary(ur.df(inf, type=c("drift"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que -2.42 no es menor que el valor crítico, no se rechaza
# hipotesis nula sin tendencia, con solo una constante
summary(ur.df(inf, type=c("none"), lags = 8, selectlags=c("BIC")))
# Dado que -1.98 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. inf estacionaria sin tendencia ni constante en el modelo

# Sugiere utilizar la variable inf sin necesidad de diferenciarla ya que muestra
# ser estacionaria en las pruebas con tendencia y sin tendencia ni constante

# ied

summary(ur.df(ied, type=c("trend"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que -1.79 no es menor que el valor crítico
summary(ur.df(ied, type=c("drift"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que -2.46 no es menor que el valor crítico
summary(ur.df(ied, type=c("none"), lags = 8, selectlags=c("BIC")))
# No estacionario ya que 0.45 no es menor que el valor crítico

# Sugiere diferenciar la serie ied para trabajar con una serie estacionaria

# r

summary(ur.df(r, type=c("trend"), lags = 8, selectlags=c("BIC")))
# Dado que -4.16 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. r estacionaria con tendencia en el modelo
summary(ur.df(r, type=c("drift"), lags = 8, selectlags=c("BIC")))
# Dado que -5.61 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. r estacionaria con una constante en el modelo
summary(ur.df(r, type=c("none"), lags = 8, selectlags=c("BIC")))
# Dado que -5.71 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. r estacionaria sin tendencia ni constante en el modelo

# Sugiere utilizar la variable r sin necesidad de diferenciarla

# Diferenciamos las series sugeridas: ai, y, ied

dai <- diff(ai)
dy <- diff(y)
died <- diff(ied)

## Estimar pruebas de raíces unitarias ADF a las variables diferenciadas:

# dai

summary(ur.df(dai, type=c("trend"), lags = 8, selectlags=c("BIC")))
# Dado que -6.29 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con tendencia en el modelo
summary(ur.df(dai, type=c("drift"), lags = 8, selectlags=c("BIC")))
# Dado que -6.14 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con una constante en el modelo
summary(ur.df(dai, type=c("none"), lags = 8, selectlags=c("BIC")))
# Dado que -5.72 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria sin tendencia ni constante en el modelo

# Sugiere utilizar la variable dai (ai diferenciada)

# dy

summary(ur.df(dy, type=c("trend"), lags = 8, selectlags=c("BIC")))
# Dado que -9.84 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con tendencia en el modelo
summary(ur.df(dy, type=c("drift"), lags = 8, selectlags=c("BIC")))
# Dado que -9.85 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con una constante en el modelo
summary(ur.df(dy, type=c("none"), lags = 8, selectlags=c("BIC")))
# Dado que -9.22 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria sin tendencia ni constante en el modelo

# Sugiere utilizar la variable dy (y diferenciada)

# died

summary(ur.df(died, type=c("trend"), lags = 8, selectlags=c("BIC")))
# Dado que -8.18 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con tendencia en el modelo
summary(ur.df(died, type=c("drift"), lags = 8, selectlags=c("BIC")))
# Dado que -8.201 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria con una constante en el modelo
summary(ur.df(died, type=c("none"), lags = 8, selectlags=c("BIC")))
# Dado que -8.12 si es menor que el valor critico al 5%, rechazamos hipotesis
# de raiz unitaria. dai estacionaria sin tendencia ni constante en el modelo

# Sugiere utilizar la variable died (ied diferenciada)

# Estimación del modelo de cointegración en niveles
modelo_niveles <- lm(ai ~ inf + r)
summary(modelo_niveles)

# Tanto la inflacion como la inflacion tienen un impacto negativo 
# en la actividad industrial.
# Un aumento en la inflacion genera un decrecimiento en la actividad industrial.
# La tasa de interés también contribuye al decrecimiento industrial


mce <- residuals(modelo_niveles)
mce  =  ts(mce, frequency = 4, start = c(1993,1))
adf_test_mce <- ur.df(mce, type = "none", lags = 8, selectlags = "BIC")
summary(adf_test_mce)

dinf <- diff(inf)
dr <- diff(r)

# Definir el modelo de corrección de errores con múltiples rezagos

(EG <- summary(dynlm(dai ~ Lag(dai, 1) + Lag(dai, 2) + Lag(dai, 3) + Lag(dai, 4) +
                       dinf + Lag(dinf, 1) + Lag(dinf, 2) + Lag(dinf, 3) + Lag(dinf, 4) +
                       dr + Lag(dr, 1) + Lag(dr, 2) + Lag(dr, 3) +
                       Lag(mce, 1)))) # MCE rezagado un periodo

# Voy eliminando los coeficientes que no sean significativos uno a uno, hasta
# que el modelo me regrese que todos los coeficientes seleccionados son
# significantes y mce sigue estando entre -1 y 0, al igual que su significancia
# rondando el 0.1

( EG <- summary (
          dynlm ( dai ~ Lag(dai, 1)  + Lag(dai, 3) + Lag(dai, 4) +
                dr + Lag(dr, 1) + Lag(dr, 2) + Lag(mce, 1) 
                )
          ) 
  )

# En este modelo ya se cumple que todos los coeficientes son significativos
# al igual que el mce, el cual sigue entre -1 y 0

EG <- dynlm(dai ~ Lag(dai, 1)  + Lag(dai, 3) + Lag(dai, 4) +
                       dr + Lag(dr, 1) + Lag(dr, 2) +
                       Lag(mce, 1))

coeficientes <- coef(EG)

efecto_dai <- sum(coeficientes[c(2, 3, 4)])
efecto_dr <- sum(coeficientes[c(5,6,7)])

efecto_dai
efecto_dr









lai <- log(ai)
linf <- log(inf)
lr <- log(r)

dlai <- diff(lai)
dlinf <- diff(linf)
dlr <- diff(lr)

var <- cbind(lai, linf, r)
VARselect(var, lag.max = 16, type = c("both"), season = 4, exogen = NULL)
summary((var_dd <- VAR(var, p = 2, type = "both")))
# La mayoría de los criterios (AIC, HQ, y FPE) sugieren que el rezago 5 es óptimo. 
# Esto indica que 5 rezagos pueden capturar bien la dinámica entre las variables 
# sin sobrecargar el modelo.

# Ahora, para asegurar que un modelo VAR cumpla con las condiciones de convergencia 
# y sea estable, es importante verificar que no haya raíces unitarias en el modelo.

roots(var_dd)
# Estos resultados indican que el modelo no tiene raíces unitarias y es 
# estacionario ya que todas las raíces están por debajo de 1.

(vc1_t <- (summary(ca.jo(var, type = "trace", ecdet = "const", spec = "longrun", K = 5, season = 4, dumvar = NULL))))

# •	r = 0: La estadística de prueba es 44.67, indica que podemos rechazar la hipótesis nula de que no hay vectores de cointegración al nivel de significancia del 5% y del 1%.
# •	r <= 1: La estadística de prueba es 17.42, sugiere que no podemos rechazar la hipótesis nula de que existe, como máximo, un vector de cointegración.
# •	r <= 2: La estadística de prueba es 6.25, indica que no hay más de un vector de cointegración.
# Los resultados sugieren que existe un solo vector de cointegración significativo al nivel del 5%, lo que indica una relación de equilibrio de largo plazo entre las variables.
#                     ut = lai -0.54*linf + 0.05*r - 4.083
# El término constante de 4.083 representa un nivel de ajuste necesario para que se mantenga esta relación de equilibrio en el tiempo.


# ut <- lai +0.2771*linf - 0.0541*lr - 4.8435
ut <- lai -0.54*linf +0.05*r - 4.083
ut <- ts(ut, frequency = 4,  start = c(1993,1))
summary(ur.df(ut, type = c("none"), lags = 8, selectlags = c("BIC")))

# El valor -7.0757 es menor que los valores críticos. Esto significa que podemos 
# rechazar la hipótesis nula de raíz unitaria con un alto nivel de confianza, 
# lo que sugiere que la serie es estacionaria.

(EG <- summary(dynlm(dlai ~ Lag(dlai, 1) + Lag(dlai, 2) + Lag(dlai, 3) + Lag(dlai, 4) +
                       dlinf + Lag(dlinf, 1) + Lag(dlinf, 2) + Lag(dlinf, 3) + Lag(dlinf, 4) +
                       dr + Lag(dr, 1) + Lag(dr, 2) + Lag(dr, 3) +
                       Lag(ut, 1))))

(EG <- summary(dynlm(dlai ~ Lag(dlai, 1) + Lag(dlai, 3) + Lag(dlai, 4) +
                      Lag(dlinf, 3) +
                       dr  +
                       Lag(ut, 1))))

