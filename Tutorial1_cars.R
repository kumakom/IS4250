install.packages("ggplot2")
install.packages("dplyr")
require(dplyr)
cars
df <- as.data.frame(cars)
plot(cars)
require(ggplot2)
qplot(speed, dist, data=df)
dplyr::filter(cars, speed==4)


