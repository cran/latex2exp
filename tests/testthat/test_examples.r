library(latex2exp)

test_that("LaTeX examples are rendered correctly", {
  expect_silent(latex2exp_examples())
})

test_that("Famous equations are rendered correctly", {
  # F = ma
  expect_renders_same("$\\bar{F} = m\\bar{a}$", 
                      bar(F) == m * bar(a))
  
  # Schrodinger equations. There is no hbar, unfortunately.
  expect_renders_same("$\\hat{H} \\Psi = E \\Psi$",
                      hat(H) * Psi == E * Psi)
  
  # Unfortunately, this fails under R 4.0.5.
  # expect_renders_same("$\\frac{ih}{2\\pi} \\frac{d}{dt} \\ket{\\Psi(t)} = \\hat{H}\\ket{\\Psi(t)}$",
  #                     frac(ih, 2*pi) * phantom(.) *
  #                     frac(d, dt) * phantom(.) *
  #                     group('|', Psi(t), rangle) ==
  #                     hat(H) * group('|', Psi(t), rangle))
  
  # # Blackbody radiation
  expect_renders_same("$B_\\lambda = \\frac{8\\pi\\nu^2}{c^3} \\frac{h\\nu}{e^{\\frac{h\\nu}{kT} - 1}}$",
                      B[lambda] == frac(8*pi*nu^2, c^3) * phantom(.) * frac(h*nu, e^{frac(h*nu, k*T) * phantom(.) -1}))
})

# This file contains samples of latex2exp uses that were
# gathered from GitHub.
test_that("Equation samples render correctly", {
  expect_renders_same("$P(\\hat{Y}) = \\frac{odds}{1+odds}$",
                      P(hat(Y)) == frac(odds, 1+odds))
  
  expect_renders_same("$P(y_{ij} = 1)=1$ when $y_{ij}$ is 0",
                      paste(P(y[ij] == 1) == 1, ' when ', y[ij], ' is 0'))
  
  expect_renders_same("$NO_{-}^3$",
                      NO[phantom()-phantom()]^3)
  
  expect_renders_same("$cov(\\Delta p_5, \\; \\Delta p_s)$",
                      cov(Delta*p[5], phantom() ~~ Delta*p[s]))
})

test_that("Samples from GitHub issues are rendered correctly", {
  expect_renders_same("$\\left(\\frac{M}{L}\\right.$",
                      bgroup('(', frac(M, L) * phantom(.), '.'))
  
  expect_renders_same("$\\bar{A}^{a;a \\rightarrow i}_{x;n\\rceil}$",
                      bar(A)[group('.', x*';'*n, rceil)]^{a*';'*a %->% i})
  # https://github.com/stefano-meschiari/latex2exp/issues/43
  expect_renders_same("$\\,\\,\\mu - 3 \\sigma$",
                      phantom(.) * phantom(.) * mu - 3 * sigma)
  
  expect_renders_same(sprintf("($\\mu$=%.0f) $E(\\bar{x}) \\, =$%.0f; $\\sigma_{\\bar{x}} \\, =$%.0f", 10, 12, 14),
                      '(' * mu * '=10) ' * { E(bar(x)) * phantom(.) == 12 } * '; ' *  
                        { sigma[bar(x)] * phantom(.) == 14 })
})
