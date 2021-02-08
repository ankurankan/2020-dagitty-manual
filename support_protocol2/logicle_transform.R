# Import the packages
library( readxl )
library( flowCore )
library( premessa )

# Load the dataset
dataset <- as.matrix( read_excel( "cd3cd28.xls" ) )

# Transform the dataset
d_flow <- as_flowFrame(dataset)
lgcl <- estimateLogicle(d_flow, channels = colnames( d_flow ) )
d_trans <- exprs( transform( d_flow, lgcl ) )

# Plot one of the columns
pdf( "logicle.pdf", width = 7, height = 3.5 )
par( font.main=1, cex.main=1, bty='l', mfrow=c( 1, 2 ), pch=19, mar=c( 4, 4, 2, 1 ) )
qqnorm( dataset[, 4], main="Before logicle transformation", cex=.5 )
qqnorm( d_trans[, 4], main="After logicle transformation", cex=.5 )
dev.off()
