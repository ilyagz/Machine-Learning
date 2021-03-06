# K-Means clustering
# Importing the dataset
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[4:5]

# Using the Elbow Method to find the optimal # of clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <- sum (kmeans(X, i)$withinss)
plot(1:10, wcss, type = 'b', main = paste('Clusters of Customers'), xlab = "Number of Clusters", ylab = 'WCSS')

# Applying k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

# Visualising the clusters
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         labels = 4,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = "Annual Income",
         ylab = "Spending Score")