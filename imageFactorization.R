# Demonstration of Funk MF on images
# Gradient descent and loop structure in matrix_factorization transposed from python tutorial (written by Albert Au Yeung) into R. 
# This core code can be found here: http://albertauyeung.com/2017/04/23/python-matrix-factorization/
# Variable name adjustments made for programmers. Additional QOL adjustments made.
# All additional functionality (image handling, parallelism) added by Ray Bosman

# Best all round settings include
# p_blockx <- (your image x/[10 or 20])
# p_blocky <- (your image y/[10 or 20])
# p_step <- 400
# p_rate <- .02
# p_factors <- 20
# p_a <- .001
# p_b <- .3

#Include libraries
library(parallel)
library(png)
library(colorspace)
library(here)

source(here("functions.R"))

#Set parameters
#Set you image directory
setting_image_directory <- paste0(here(),"/images/")

#Image name - use png (color or black and white)
setting_image <- "14.png"

#How big do you want your sub matrices to be - smaller runs faster, x set to image x size, will run slower
#and will serialize your processing. x divided by blockx must equal zero
#My image is a black and white png at 600x370 pixels
setting_blockx <- 60          
#Same as above but for Y axis
setting_blocky <- 37         
#Steps - similar to epochs 
setting_step <- 50       
#Learning rate    
setting_rate <- .02           
#More factors captures more details but will lead to longer processing times
setting_factors <- 5         
#Initilize P and Q with these uniform coefficients - values too large yields overflow errors. 
#a and b in uniform distribution.
setting_a <- .01              
setting_b <- .3               
#% of pixel corruption in image
setting_corruption <- (3/5)   
#Number of cores to use. More submatrices controlled by blockx and y allows more parallel processing.
setting_cpu <- 4             

#Corrupt and correct the image
CorrectImage(setting_image_directory
            ,setting_image
            ,setting_blockx
            ,setting_blocky
            ,setting_step
            ,setting_rate
            ,setting_factors
            ,setting_a
            ,setting_b
            ,setting_corruption
            ,setting_cpu)
