m = 60

cosmos = matrix(floor(runif(m*m, min=0, max=2)), ncol=m)

MAXITER = 400

up <- c(2:m, 1)
down <- c(m, 2:m-1)

iters <- c(1:MAXITER)

for ( i in iters) {
    neighbours = cosmos[up, 1:m] + cosmos[down, 1:m] + cosmos[1:m, up] + cosmos[1:m, down] +
                 cosmos[up, up] + cosmos[up, down] + cosmos[down, up] + cosmos[down, down]
    cosmos = (neighbours == 3 | cosmos & neighbours == 2) * 1

    image(cosmos, axes = FALSE, col = grey(seq(0, 1, length = 256)))

    p1 <- proc.time()
    Sys.sleep(0.02)
    proc.time() - p1
}
