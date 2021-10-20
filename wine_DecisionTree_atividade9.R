red_wine_ds = read.csv(file="c://Users/Felipe/OneDrive - Fatec Centro Paula Souza/BIG DATA_NO_AGRONEGÓCIO/6° Termo/Lab de Big Data/Documentos/Bases de Dados/winequality-red.csv", sep=";",header=T)
View(red_wine_ds)

white_wine_ds = read.csv(file="c://Users/Felipe/OneDrive - Fatec Centro Paula Souza/BIG DATA_NO_AGRONEGÓCIO/6° Termo/Lab de Big Data/Documentos/Bases de Dados/winequality-white.csv", sep=";", header=T)
View(white_wine_ds)

# Vinho Tinto
# Separando 70% para treino e 30 % para teste
nrow(red_wine_ds)
sample(1:1599,1119)

set.seed(123)
filtro <- sample(1:nrow(red_wine_ds), nrow(red_wine_ds)*0.7)
# treino vai usar os dados de filtro]
treino <- red_wine_ds[filtro,]

# teste conterá o inverso de filtro
teste <- red_wine_ds[-filtro,]
teste
# importando o pacote "rpart" que possui algoritmos de árvores de decisão.
install.packages("rpart")
library(rpart)

modelo <- rpart(quality ~., data = treino)
install.packages("rpart.plot")
library ("rpart.plot")

prp (modelo, extra=1)

# Avaliando a previsao do teste
prev = predict(modelo, teste, type = "vector")
new_prev = round(prev,0)
View(new_prev)

# Teste de acurácia do modelo:
install.packages("caret")
library(caret)

# CORRIGIR PROBLEMAS COM FACTOR
treino_factor <- factor(treino, )
treino
treino_factor


confusionMatrix (prev,teste$Quality)



