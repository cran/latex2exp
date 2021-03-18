## ---- setup, include=FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5)

## ---- eval=FALSE--------------------------------------------------------------
#  install.packages('latex2exp')

## ---- eval=FALSE--------------------------------------------------------------
#  devtools::install_github('stefano-meschiari/latex2exp')

## -----------------------------------------------------------------------------
library(latex2exp)

## ---- eval=FALSE--------------------------------------------------------------
#  TeX('$\\gamma^\\alpha$')

## ---- eval=FALSE--------------------------------------------------------------
#  TeX(r'($\gamma^\alpha$)')

## ---- warning=FALSE-----------------------------------------------------------
x <- seq(0, 4, length.out=100)
alpha <- 1:5

plot(x, xlim=c(0, 4), ylim=c(0, 10), 
     xlab='x', ylab=TeX(r'($\alpha  x^\alpha$, where $\alpha \in 1 \ldots 5$)'), 
     type='n', main=TeX(r'(Using $\LaTeX$ for plotting in base graphics!)', bold=TRUE, italic=TRUE))

invisible(sapply(alpha, function(a) lines(x, a*x^a, col=a)))

legend('topleft', legend=TeX(sprintf(r'($\alpha = %d$)', alpha)), 
       lwd=1, col=alpha)

## ---- warning=FALSE, eval=FALSE-----------------------------------------------
#  library(purrr)
#  library(ggplot2)
#  library(tibble)
#  
#  x <- seq(0, 4, length.out=100)
#  alpha <- 1:5
#  data <- map_df(alpha, ~ tibble(v=.*x^., x=x, alpha=.))
#  
#  p <- ggplot(data, aes(x=x, y=v, color=as.factor(alpha))) +
#      geom_line() +
#      ylab(TeX(r'($\alpha  x^\alpha$, where $\alpha \in 1\ldots 5$)')) +
#      ggtitle(TeX(r'(Using $\LaTeX$ for plotting in ggplot2. I $\heartsuit$ ggplot!)')) +
#      coord_cartesian(ylim=c(-1, 10)) +
#      guides(color=guide_legend(title=NULL)) +
#      scale_color_discrete(labels=lapply(sprintf(r'($\alpha = %d$)', alpha), TeX))
#      # Note that ggplot2 legend labels must be lists of expressions, not vectors of expressions
#  
#  print(p)

## ---- fig.height=2------------------------------------------------------------
plot(TeX(r'(A $\LaTeX$ formula: $\frac{2hc^2}{\lambda^5} \, 
               \frac{1}{e^{\frac{hc}{\lambda k_B T}} - 1}$)'), cex=2)

## ---- eval=FALSE--------------------------------------------------------------
#  TeX(r'(My string containing math $\sin(2\pi\lambda x)$)')

## ---- eval=FALSE--------------------------------------------------------------
#  TeX(r'(My string containing math $\sin(2\pi\lambda x)$)', bold=TRUE, italic=TRUE)

## ---- eval=FALSE--------------------------------------------------------------
#  TeX('latexString', output=c('expression', 'character', 'ast'))

## ---- eval=FALSE--------------------------------------------------------------
#  latex2exp_examples()

## ---- eval=FALSE--------------------------------------------------------------
#  latex2exp_supported(plot=FALSE)

## ---- fig.width=8, fig.height=8-----------------------------------------------
latex2exp_supported(plot=TRUE)

## ---- fig.width=8, fig.height=7-----------------------------------------------
latex2exp_examples()

