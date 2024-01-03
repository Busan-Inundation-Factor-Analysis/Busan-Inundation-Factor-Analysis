# 패키지 설치 
## install.packages("MASS")
## install.packages("ggplot2")
## install.packages("caret") 
## install.packages("corrplot")
## install.packages("car")
library(MASS)
library(ggplot2)
library(caret)
library(corrplot)
library(car)#독립성 Durbin-Watson 검정

## 회귀분석
df_reg <- read.csv(file="C:/Users/gmltj/OneDrive/바탕 화면/데이터분석/전처리완료데이터.csv",header=T)
sapply(df_reg, FUN="class")

model_1=lm(Y~X1+X2+X3+X4+X5+X6+X7+X8, data=df_reg)
summary(model_1)

# 상관관계 -> 높은 상관관계 제외
(cor_mat <- cor(df_reg[c(2:9)]))
corrplot(cor_mat, order='hclust')

# log 변환
model_2 = lm(log(Y)~log(X1)+log(X2)+log(X3)+log(X4)+log(X5)+log(X6)+log(X7)+log(X8),data=df_reg)
model_2
summary(model_2)

step(model_2,direction="both")

model_3 = lm(log(Y)~log(X1)+log(X3)+log(X4)+log(X5)+log(X6),data=df_reg)
summary(model_3)

# 회귀모델 비교
anova(model_2,model_3)

# 다중공선성 확인
vif(model_3)

# 변수의 상대적 중요성
relweights <- function(fit,...){
    R <- cor(fit$model)
    nvar <- ncol(R)
    rxx <- R[2:nvar, 2:nvar]
    rxy <- R[2:nvar, 1]
    svd <- eigen(rxx)
    evec <- svd$vectors
    ev <- svd$values
    delta <- diag(sqrt(ev))
    lambda <- evec %*% delta %*% t(evec)
    lambdasq <- lambda ^ 2
    beta <- solve(lambda) %*% rxy
    rsquare <- colSums(beta ^ 2)
    rawwgt <- lambdasq %*% beta ^ 2
    import <- (rawwgt / rsquare) * 100
    import <- as.data.frame(import)
    row.names(import) <- names(fit$model[2:nvar])
    names(import) <- "Weights"
    import <- import[order(import),1, drop=FALSE]
    dotchart(import$Weights, labels=row.names(import),
                 xlab="% of R-Square", pch=19,
                 main="Relative Importance of Predictor Variables",
                 sub=paste("Total R-Square=", round(rsquare, digits=3)),
                 ...)
    return(import)
}    

result = relweights(model_3,col="blue")

# ggplot2을 사용하여, 변수의 상대적 중요도를 시각화
library(ggplot2)
plotRelWeights=function(fit){
	data<-relweights(fit)
	data$Predictors<-rownames(data)
	p<-ggplot(data=data,aes(x=reorder(Predictors,Weights),y=Weights,fill=Predictors))+
	  geom_bar(stat="identity",width=0.5)+
	  ggtitle("Relative Importance of Predictor Variables")+
	  ylab(paste0("% of R-square \n(Total R-Square=",attr(data,"R-square"),")"))+
	  geom_text(aes(y=Weights-0.1,label=paste(round(Weights,1),"%")),hjust=1)+
	  guides(fill=FALSE)+
	  coord_flip()
p
}

plotRelWeights(model_3)


