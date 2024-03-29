# Carregando o dataset
df <- read.csv("C:\\Users\\Felipe\\OneDrive - Fatec Centro Paula Souza\\BIG DATA_NO_AGRONEG�CIO\\6� Termo\\Lab de Big Data\\Documentos\\Bases de Dados\\fipe_jun2018.csv", header=TRUE, encoding="UTF-8")
View(df)

#Tipos de dados do dataset:
str(df)
df$brand <- as.factor(df$brand)
df$vehicle <- as.factor(df$vehicle)
df$fuel <- as.factor(df$fuel)
df$price <- as.factor(df$price)
str(df)

# Excluindo colunas que n�o ser�o utilizadas:
df$X <- NULL
df$price_reference <- NULL

#Renomeando as colunas:
##mostra os nomes atuais:
names(df)
#alterando os nomes para:
names(df) <- c("Marca", "Carro", "Ano_Modelo", "Combustivel", "Preco")
names(df)

#Analisando os dados:
summary(df$Ano_Modelo)
## Valor "max" est� estranho, n�o tem rela��o com o restante dos dados. Vamos tratar
df$Ano_Modelo[df$Ano_Modelo==32000] <- "Zero KM"
df$Ano_Modelo <- as.factor(df$Ano_Modelo)
summary(df$Ano_Modelo)

# Analisando a coluna de pre�os:
str(df$Preco)
summary(df$Preco)
##tratando precos
df$Preco1 <- as.factor(df$Preco)
summary(df$Preco1)
#Iremos usar a fun��o gsub que busca padr�es e os trata (substrings)... Maiores detalhes fa�a > ?gsub para acionar o help do R
## Exclunido Coluna Preco1
df$Preco1 <- NULL
# Usando a Fun��o GSUB, procura ele localiza e substitu�. Vamos tratar a String em Preco
df$Preco1 <- gsub("R\\$|\\.| ","",df$Preco)
View(df)
## Deu certo, agora vamos aplicar a coluna Preco
df$Preco1 <- NULL
df$Preco <- gsub("R\\$|\\.| ","",df$Preco)
summary(df$Preco)
#A vari�vel Preco ainda est� como character, precisamos alterar para n�merica.
df$Preco <- as.numeric(gsub("\\,",".",df$Preco))
summary(df$Preco)
str(df)
