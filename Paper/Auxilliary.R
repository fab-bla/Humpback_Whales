## Aux ##

# packages
get.package <- function(package){
  
  lapply(package, function(x){
    if(!require(x, character.only = T)){
      install.packages(x)
    }
    library(x, character.only = T)     
  })
  
}

# invis plot
invis.Map <- function(f, ...) invisible(Map(f, ...))
invis.lapply <- function(x, f) invisible(lapply(x, f))
invis.rapply <- function(object, f, classes = "ANY", deflt = NULL, 
                         how = c("unlist", "replace", "list"), ...){
                         invisible(rapply(object, f, classes = "ANY", deflt = NULL,
                         how = c("unlist", "replace", "list"), ...))}

# Normal plots
Dens_norm_plot <- \(data = dat_whale, y){
  
  # init. plot
  ggplot(data, aes(.data[[y]])) +

    # hist
    geom_histogram(aes(y = ..density..), fill = "cornflowerblue", col = "deepskyblue4") +
    
    # fit normal
    stat_function(fun = dnorm, 
                  args = list(mean = mean(dat_whale[[y]], na.rm = TRUE), 
                              sd = sd(dat_whale[[y]], na.rm = TRUE)),
                  col = "darkblue", lwd = 1, lty = "dashed") +
    theme_bw() 
  
}