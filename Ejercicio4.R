
# Modelos no Paramétricos y de Regresión 2022-2

##########################
# Examen 2 Ejercicio 4  #
##########################

rm(list = ls(all.names = TRUE))
gc()

library(dplyr)
library(ggplot2)
library(tidyverse)
library(kableExtra)
library(lmtest)
library(car)
library(nortest)
library(broom)
library(normtest)
setwd("C:/Users/arman/OneDrive/Escritorio/Examen 2")
base <- read.csv("Ex4A.csv")
str(base) # Ambas variables de tipo char
base$Sexo <- factor(base$Sexo) # Transformamos a factor variable Sexo
base$Trat <- factor(base$Trat) #  Transformamos a factor variable Trat
str(base)
levels(base$Sexo) # Dos niveles
levels(base$Trat) # Tres niveles

# i. ----------
# Realice un análisis descriptivo de los datos. Dado que las dos 
# covariables son categóricas

base %>% group_by(Trat, Sexo) %>% # Agrupamos por tartamiento y sexo 
  summarise(Observaciones = n(),
            Media = round(mean(Puntaje),2),
            Mediana = median(Puntaje),
            Varianza = round(var(Puntaje),2))
# Observamos gracias a esta tabla que la media de puntaje de las mujeres es 
# mayor que la de los hombres con los tres tratamientos, aunque en el Trat2
# es donde la diferencia es mayor. Lo mismo se observa en el caso de la mediana 

ggplot(base, aes(Sexo, Puntaje)) + geom_boxplot() + labs(title = "Sexo vs Puntaje",
                                                         x= "Sexo", y= "Puntaje")
# Media de las mujeres por encima de los hombres, es más probable encontrar mejor
# puntaje de ansiedad en una mujer que en un hombre
ggplot(base, aes(Trat, Puntaje)) + geom_boxplot() + labs(title = "Trat vs Puntaje",
                                                         x= "Trat", y= "Puntaje")
# En cuanto a los tratameintos, la gráfica indica que el emjro tratamiento sería 
# el Tratamiento 2 ya que las medias tanto de los que recibieron el Tratamiento 1
# como de los que no recibieron ninguno está por encima de esta, e incluso reccalcar
# que la media de los que no recibieron nada está por encima de ambos Trat

ggplot(base, aes(Trat, Puntaje)) + geom_boxplot() + facet_wrap(~Sexo) 
#boxplot(Puntaje~Trat+Sexo, data = base)
# Ahora, esta gráfica separando la eficacia de los tratamientos por sexo nos 
# deja ver que en los hombres como en mujeres se percibe un mayor puntaje de ansiedad
# en los casos que no reciben medicamento. A la vez podemos observar que en los hombres
# tiene mayor eficacia el Trat2 mientras que en las muejeres funciona mejor el Trat1

# ii. -----------
# Considerando un modelo de regresión que incluye las dos variables categóricas 
# de forma individual y también su interacción, dé la expresión del puntaje 
# promedio para cada valor de las variables categóricas.

ajuste <- lm(Puntaje ~ Trat * Sexo, data = base)
summary(ajuste) # Toma las categorías Control y Hombre de referncia
coef(ajuste)

# E(y;x) = b0 + b1Trat1 + b2Trat2 + b3Mujer + b4(Trat1*Mujer) + b5(Trat2*Mujer)

# E(y;Control;Hombre) = b0
# E(y;Control;Mujer) = b0 + b3
# E(y;Trat1;Hombre) = b0 + b1 
# E(y;Trat1;Mujer) = b0 + b1 + b3 + b4
# E(y;Trat2;Hombre) = b0 + b2 
# E(y;Trat2;Mujer) = b0 + b2 + b3 + b5

coef(ajuste)
# b0 = 10.15, b1= -1.84, b2= -3.94, b3= 0.31, b4= -0.3, b5= 3.58

# E(y;Control;Hombre) = 10.15
# E(y;Control;Mujer) = 10.15 + 0.31 = 10.46
# E(y;Trat1;Hombre) = 10.15 -1.84 = 8.31
# E(y;Trat1;Mujer) = 10.15 -1.84 + 0.31 -0.3 = 8.32
# E(y;Trat2;Hombre) = 10.15 -3.94 = 6.21
# E(y;Trat2;Mujer) = 10.15 -3.94 + 0.31 + 3.58 = 10.1

# iii. ----
# Escriba las hipótesis que se contrastan con la tabla ANOVA, 
# calcule ésta e interprete. Use alpha = 0.05

# H_0: b1 = b2 = b3 = b4 = b5 = 0  vs H_a: b1!=0 o b2!=0 o b3!=0 o b4!=0 o b5!=0

summary(ajuste)

mat <- matrix(c(0,1,0,0,0,0,
           0,0,1,0,0,0,
           0,0,0,1,0,0,
           0,0,0,0,1,0,
           0,0,0,0,0,1), ncol=6, nrow=5, byrow=TRUE)
res <- c(0,0,0,0,0)
summary(glht(ajuste, linfct=mat, rhs=res),test=Ftest())

# p-value = 1.29e-08 < 0.05. Con una confianza del 95% rechazamos H_0, entonces
# el modelo tiene sentido, nos ayuda a modelar E(Y)

# iv. ----
# ¿Se puede considerar que el sexo tiene un efecto en el puntaje, es decir, 
# al menos para un tratamiento existe un efecto diferenciado en el puntaje 
# derivado del sexo de los individos? Use una prueba F con = .025. Interprete.

# E(y;x) = b0 + b1Trat1 + b2Trat2 + b3Mujer + b4(Trat1*Mujer) + b5(Trat2*Mujer)
# E(y;Control,Hombre) = b0 = b0 + b3 = E(y;Control,Mujer)
# E(y;Trat1,Hombre) = b0 + b1 = b0 + b1 + b3 + b4 = E(y;Trat1,Mujer)
# E(y;Trat2,Hombre ) = b0 + b2 = b0 + b2 + b3 + b5 = E(y;Trat2,Mujer)

# E(y;Control,Hombre) = E(y;Control,Mujer) => b3 = 0
# E(y;Trat1,Hombre) = E(y;Trat1,Mujer) => b3 + b4 = 0
# E(y;Trat2,Hombre ) = E(y;Trat2,Mujer) => b3 + b5 = 0

# H0: b3 = 0,  b3+b4 = 0, b3+b5 = 0 vs Ha: b3 != 0 o b3+b4 != 0 o b3+b5 != 0

K1=matrix(c(0,0,0,1,0,0,
           0,0,0,1,1,0,
           0,0,0,1,0,1), ncol=6, nrow=3, byrow=TRUE)
m1=c(0,0,0)
summary(glht(ajuste, linfct=K1, rhs=m1),test=Ftest())

# Con un p-value = 4.29e-06 < 0.05 y una confianza del 95% se
# rechaza H0, al menos un nivel de tratamiento muestra un diferencia entre
# hombres y mujeres.

# Considere una prueba simultánea que ayude a identificar para qué tratamiento se
# puede considerar que el sexo tiene un efecto, con los resultados de esa prueba 
# reduzca el modelo si es posible.

K2 <- matrix(c(0,0,0,1,0,0,
           0,0,0,1,1,0,
           0,0,0,1,0,1), ncol=6, nrow=3, byrow=TRUE)
m2 <- c(0,0,0)
summary(glht(ajuste, linfct=K2, rhs=m2))
# Podemos observar que se rechaza b3 + b5 = 0 con un p-value = 1e-05 < 0.05
# Por otro lado asumimos con p-value > 0.05 en ambos casos que 
# b3 = 0 y b3 + b4 = 0, la segunda prueba es redundante una vez que tenemos b3 = 0
# por tanto se traduce a que b4 = 0

# Lo anterior indica que las variables relacionadas a ambas betas no suman a nuestro modelo

# Ajustamos nuevo modelo 
# E(y;x) = b0 + b1Trat1 + b2Trat2 + b5(Trat2*Mujer)

# v. ----
# En caso de que en el inciso anterior se haya reducido el modelo, ajuste de 
# nuevo la regresión y dé la expresión del puntaje promedio para cada valor 
# en las variables categóricas:

#Ajustamos el modelo reducido
ajuste2 <- lm(Puntaje ~ Trat + I((Trat == "Trat2") *(Sexo=="Mujer")), data=base)
summary(ajuste2)
# b0 = 10.3, b1 = -1.99, b2 = -4.1, b3 = 3.89

# E(y;x) = b0 + b1Trat1 + b2Trat2 + b3(Trat2*Mujer)

# E(y;Control,Hombre) = b0 = 10.3
# E(y;Control,Mujer) = b0 = 10.3
# E(y;Trat1,Hombre) = b0 + b1 = 10.3 - 1.99 = 8.31
# E(y;Trat1,Mujer) = b0 + b1 = 10.3 - 1.99 = 8.31
# E(y;Trat2,Hombre) = b0 + b2 = 10.3 -4.1 = 6.2
# E(y;Trat2,Mujer) = b0 + b2 + b3 = 10.3 -4.1 + 3.89 = 10.09

# vi. ----

# Realice una prueba de hipotesis para argumentar en favor o en contra de la hipotesis: el nuevo 
# tratamiento tiene el mejor desempeño. Use alpha = 0.05

# E(y;x) = b0 + b1Trat1 + b2Trat2 + b3(Trat2*Mujer)
# Trat 2 mejor que control y Trat 2 mejor que Trat 1
# E(y; Trat2) > E(y; Control) y E(y; Trat2) > E(y; Trat1) 
# b0 + b2 > b0 y b0 + b2 + b3 > b0 + b1
# b2 < 0 y b1 - b2 - b3 < 0

K3 <- matrix(c(0,0,1,0,
           0,1,-1,-1), ncol=4, nrow=2, byrow=TRUE)
m3 <- c(0,0)
summary(glht(ajuste2, linfct=K3, rhs=m3, alternative="less"))

# Con un p-value < 0.05 es posible asumir que el Trat 2 es mejor que el Control,
# al igual que el Trat1. Por tanto, con una confianza del 95% argumentamos
# a favor de la hipótesis: el nuevo tratamiento tiene mejor desempeño

# vii. ----

# Realice una prueba de hipótesis para argumentar en favor o en contra de 
# la hipótesis: el nuevo tratamiento tiene el mejor desempeño en hombres, 
# aunque el tratamiento actual lo tiene en mujeres. Use alpha = 0.05

# E(y;x) = b0 + b1Trat1 + b2Trat2 + b3(Trat2*Mujer)
# E(y;Trat2;Hombre) > E(y;Trat1;Hombre) y E(y;Trat2;Hombre) > E(y;Control;Hombre)
# b0 + b2 > b0 + b1     y     b0 + b2 > b0  
# b1 - b2 < 0 y b2 < 0

K4 <- matrix(c(0,1,-1,0,
               0,0,1,0), ncol=4, nrow=2, byrow=TRUE)
m4 <- c(0,0)
summary(glht(ajuste2, linfct=K4, rhs=m4, alternative="less"))

# E(y;Trat1;Mujer) > E(y;Trat2;Mujer) y E(y;Trat1;Mujer) > E(y;Control;Mujer)
# b0 + b1 > b0 + b2 + b3  y  b0 + b1 > b0 
#  b1 - b2 - b3 > 0  y  b1 > 0
K5 <- matrix(c(0,1,-1,-1,
               0,1,0,0), ncol=4, nrow=2, byrow=TRUE)
m5 <- c(0,0)
summary(glht(ajuste2, linfct=K5, rhs=m5, alternative="greater"))

# Observamos que en ambos casos los p-values con menores a nuestra significancia 
# de 0.05, por tanto es factible concluir que el Trat2 es más efectivo en hombres 
# y que el Trat1 es más efectivo en mujeres 


K8 <- matrix(c(0,-1,1,0,
               0,0,1,0,
               0,1,-1,-1,
               0,1,0,0), ncol=4, nrow=4, byrow=TRUE)
m8 <- c(0,0,0,0)
summary(glht(ajuste2, linfct=K8, rhs=m8, alternative="less"))











