# Generate random log-normal distributed data.
X <- rlnorm( 500 )

# Formatting the plot
par( font.main=1, cex.main=1, bty='l', mfrow=c(1,2), pch=19, mar=c(4,4,2,1) )

# Plots the QQ plot for the generated data, and after log transformation.
qqnorm( X, main="Before log transformation", cex=.5 )
qqnorm( log(X), main="After log transformation", cex=.5 )
