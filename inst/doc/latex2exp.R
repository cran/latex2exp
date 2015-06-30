## ------------------------------------------------------------------------
library(latex2exp)

## ---- eval=FALSE---------------------------------------------------------
#  latex2exp('$\\alpha^\\beta$')

## ---- warning=FALSE, fig.width=7, fig.height=5---------------------------
x <- seq(0, 4, length.out=100)
alpha <- 1:5

plot(x, xlim=c(0, 4), ylim=c(0, 10), xlab='x', type='n',
     ylab=latex2exp('$\\alpha  x^\\alpha$, where $\\alpha \\in 1\\ldots 5$'),  
     main=latex2exp('Using $\\LaTeX$ for plotting in base graphics!'))

invisible(sapply(alpha, function(a) lines(x, a*x^a, col=a)))

legend('topleft', legend=latex2exp(sprintf("$\\alpha = %d$", alpha)), lwd=1, col=alpha)

## ---- warning=FALSE, fig.width=7, fig.height=5---------------------------
library(plyr)
library(ggplot2)

x <- seq(0, 4, length.out=100)
alpha <- 1:5
data <- mdply(alpha, function(a, x) data.frame(v=a*x^a, x=x), x)

p <- ggplot(data, aes(x=x, y=v, color=X1)) +
    geom_line() + 
    ylab(latex2exp('$\\alpha  x^\\alpha$, where $\\alpha \\in 1\\ldots 5$')) +
    ggtitle(latex2exp('Using $\\LaTeX$ for plotting in ggplot2. I $\\heartsuit$ ggplot!')) +
    coord_cartesian(ylim=c(-1, 10)) +
    guides(color=guide_legend(title=NULL)) +
    scale_color_discrete(labels=lapply(sprintf('$\\alpha = %d$', alpha), latex2exp)) 
    # Note that ggplot2 legend labels must be lists of expressions, not vectors of expressions

print(p)

## ---- fig.width=7, fig.height=2------------------------------------------
plot(latex2exp("A $\\LaTeX$ formula: $\\frac{2hc^2}{\\lambda^5}  \\, 
               \\frac{1}{e^{\\frac{hc}{\\lambda k_B T}} - 1}$"), cex=2)

## ---- eval=FALSE---------------------------------------------------------
#  latex2exp('latexString')

## ---- eval=FALSE---------------------------------------------------------
#  latex2exp('latexString', output=c('expression', 'character', 'ast'))

## ---- eval=FALSE---------------------------------------------------------
#  latex2exp_examples()

## ---- eval=FALSE---------------------------------------------------------
#  latex2exp_supported(plot=FALSE)

## ---- fig.width=10, fig.height=10----------------------------------------
latex2exp_supported(plot=TRUE)

## ---- fig.width=12, fig.height=7-----------------------------------------
latex2exp_examples()

