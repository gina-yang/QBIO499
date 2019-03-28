> park <- read.csv("parkinsons_updrs.data")
> formula <- as.formula((paste("motor_UPDRS~",paste(colnames(park[7:22]),collapse="+"))))
> glm.fit = glm(formula, data=park)
> ff = regsubsets(formula, data=park, method="forward")