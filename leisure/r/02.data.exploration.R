source("../library/head.R")

fun.install.require("Hmisc")

df.imported <- fun.read.csv("music.imported.csv")

options(latexcmd='latex')
options(dviExtension='dvi')
options('evince')

latex(describe(df.imported))

pairs(df.imported, lower.panel=panel.smooth, upper.panel=fun.panel.cor)

round(cor(df.imported),2)

describe(df.imported)

png(filename = "../graphic/.png", height=600, width=600)
ggplot(data.frame(year=vec.years, freq=vec.freq.cat.vs.non.cat), aes(x=year, y=freq), binwidth=1 )+
labs(title="Fraction of Catalan to non-Catalan graduatioin over time") + 
geom_line(color="red") +
geom_smooth() 
dev.off()
