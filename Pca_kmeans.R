#A
set.seed(2)
x <- matrix(rnorm(20 * 3 * 50, mean = 0, sd = 0.001), ncol = 50)
x[1:20, 2] <- 1
x[21:40, 1] <- 2
x[21:40, 2] <- 2
x[41:60, 1] <- 1
true.labels <- c(rep(1, 20), rep(2, 20), rep(3, 20))

#B
pca <- prcomp(x)
summary(pca)
pca$x[,1:2]
plot(pca$x[, 1:2], col = 1:3, xlab = "Z1", ylab = "Z2", pch = 19)

#C
km.out <- kmeans(x, 3, nstart = 20)
table(true.labels, km.out$cluster)

#D
km.out <- kmeans(x, 2, nstart = 20)
table(true.labels, km.out$cluster)

#E
km.out <- kmeans(x, 4, nstart = 20)
table(true.labels, km.out$cluster)

#F
km <- kmeans(pca$x[, 1:2], 3, nstart = 20)
table(true.labels, km$cluster)

#G
km.out <- kmeans(scale(x), 3, nstart = 20)
table(true.labels, km.out$cluster)
