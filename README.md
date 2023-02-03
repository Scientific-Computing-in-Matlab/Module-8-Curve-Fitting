# Module-8 Curve Fitting 

Curve fitting, including linear regression, is a powerful way to assess whether signals you observe behave in a predictable manner. 

## Objectives
At the end of this module, you will be able to

- Determine the correlation between measurements and independent variables
- Fit data to any function
- Use a general linear model to analyze data

## Materials
 
 - The main MLX `./docs/curveFitting.mlx` explains various approaches to curve fitting in Matlab.
 -  `./docs/errorSurface.mlx` visualizes a so-called error surface associated with curve fitting.
 
 ## Assignments
 
As discussed in `./docs/curveFitting.mlx` for nonlinear curve fitting there is no guarantee that the fit function finds the global optimum. While there are some fancy tools (e.g. simulated annealing) to improve the likelihood of finding a global optimum, in this assignment you'll create a function that uses a brute-force technique.

Your assignment is to write a function that runs a nonlinear fit (using the `fit.m` function in the Curve Fitting Toolbox) from a range of starting positions and returns the best overall fit.

Start from the `./code/iterateFit.m` function in the code folder.

Steps:
1. The function should be documented and commented appropriately.
1. `iterateFit` should return the same output as `fit`
1. `iterateFit` should accept the same inputs as `fit`  (including **all** its parameter/value pairs)
1. `iterateFit` should also accept the following parameter/value pair:
  - `min` (the lowest starting point for each parameter) `max` (largest starting point) and `n` (the total number of starting points to try).
1. `iterateFit`  should generate `n` random starting positions distributed randomly between `min` and `max` for each parameter, loop over those, and return the best overall solution. Hint use `rand`.
 

 
