#Árvore de decição com dataset Iris
str(iris)
View(iris)

# Criando 70% base de dados para treino e 30% para teste aleatoriamente 
nrow(iris)
sample(1:150,105)

# Usar set.seed para forçar os mesmos dados aleatorios em todas as
# ocasioões de uso do sample
set.seed(123)
# Filtro conterá os dados aleatórios
filtro <- sample(1:nrow(iris), nrow(iris)*0.7)
# treino vai usar os dados de filtro]
treino <- iris[filtro,]
# teste conterá o inverso de filtro
teste <- iris[-filtro,] 

# importando o pacote "rpart" que possui algoritmos de árvores de decisão.
install.packages("rpart")
library(rpart)
# Criando o modelo de Árvore de decisão. Usar método rpart e nos parâmetros especificar o atributo Species para ser classificado em função de todas as outras variáveis
modelo <- rpart(Species ~., data = treino)
# Visualizar o modelo com rpart.plot
install.packages("rpart.plot")
library ("rpart.plot")

prp (modelo, extra=1)

# Avaliando a previsao do teste
prev = predict(modelo, teste, type = "class")
View(prev)

# Teste de acurácia do modelo:
install.packages("caret")
library(caret)

confusionMatrix (prev,teste$Species)


