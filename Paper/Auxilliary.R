## Aux ##

# packages
get.package <- \(package){
  
  # loop over passed packages
  lapply(package, \(x){
    
    # if the package is not yet installed
    if(!require(x, character.only = TRUE)){
      
      # install
      install.packages(x)
      
    }
    
    # if the package is already installed, call the package
    library(x, character.only = TRUE)  
    
  })
  
}

# invis. apply family
invis.Map <- \(f, ...) invisible(Map(f, ...))
invis.lapply <- \(x, f) invisible(lapply(x, f))
invis.rapply <- \(object, f, classes = "ANY", deflt = NULL, 
                         how = c("unlist", "replace", "list"), ...){
                         invisible(rapply(object, f, classes = "ANY", deflt = NULL,
                         how = c("unlist", "replace", "list"), ...))}

# Normal plots
Dens_norm_plot <- \(data = dat_whale, y, bg_alt = FALSE){
  
  # init. plot
  ggplot(data, aes(.data[[y]])) +

    # hist
    geom_histogram(aes(y = ..density..), fill = "cornflowerblue", col = "deepskyblue4") +
    
    # fit normal
    stat_function(fun = dnorm, 
                  args = list(mean = mean(data[[y]], na.rm = TRUE), 
                              sd = sd(data[[y]], na.rm = TRUE)),
                  col = "darkblue", lwd = 1, lty = "dashed") +
    theme_bw() +
    
    # add colored grid optionally
    {if(bg_alt) theme(panel.background = element_rect(fill = "#90EE90",
                                      size = 2, linetype = "solid"),
          panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "white"), 
          panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "white"))}
  
}