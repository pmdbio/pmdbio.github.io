# Read the csv file
zika <- read.csv('~/Documentos/trabalho/programmed_biology/sage_ms_zika_casos_2016.csv')

# Convert the dataframe in a matrix and transpose
zika_matrix <- as.matrix(zika[,-1])
zika_matrix <- t(zika_matrix)


# Open PDF device
pdf('zika_r_basenew.pdf', width = 15, height = 3.3)

# Set the margins
par(mar = c(8, 5, 2, 2))

# Make the plot
barp <- barplot(zika_matrix, beside = TRUE,
                col = c('green', 'purple', 'red', 'black'),
                las = 1)

# Make the 'x' axis
axis(side = 1,
     at = barp[2,], labels = rep("",44), line = .25)
text(x = barp[2,]-4, y = par('usr')[3]-3500, labels = zika$Semana, srt=45, xpd = TRUE)

title(xlab = 'Semana Epidemiológica', line = 4)
title(ylab = 'Casos', line = 4)



diff <- par('usr')[2]-par('usr')[1]

# Make the legend
legend(x = par('usr')[1]+diff/4, y = par('usr')[3]-8000, legend = 'Casos Notificados',
       fill = 'green', xpd = TRUE, horiz = TRUE, bty = "n")

legend(x = par('usr')[1]+diff/4+diff/8, y = par('usr')[3]-8000, legend = 'Em Investigação',
       fill = 'purple', xpd = TRUE, horiz = TRUE, bty = "n")

legend(x = par('usr')[1]+diff/4+(diff/8)*2, y = par('usr')[3]-8000, legend = 'Casos Confirmados',
       fill = 'red', xpd = TRUE, horiz = TRUE, bty = "n")

legend(x = par('usr')[1]+diff/4+(diff/8)*3, y = par('usr')[3]-8000, legend = 'Casos Descartados',
       fill = 'black', xpd = TRUE, horiz = TRUE, bty = "n")



# Turn PDF device off
dev.off()