hw5data = read.csv("DataforHW5.csv", header = T)

c1 = hw5data$midterm1
c2 = hw5data$midterm2

bootstrap(c1, 0.95, 1000, fracAboveThres, 90)
bootstrap(c2, 0.75, 1000, fracAboveThres, 60)