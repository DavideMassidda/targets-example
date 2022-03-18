# Create a pretty boxplot
get_plot_obs <- function(.data) {
    ggplot(.data, aes(x=Group, y=Value, fill=Group)) + geom_boxplot()
}

# Linear model with advanced manipulations
get_lm_fit <- function(.data, .levels=NULL, .contr_fun=contr.treatment) {
    if(is.null(.levels)) {
        .levels <- sort(unique(.data$Group))
    }
    .data$Group <- factor(.data$Group, levels=.levels)
    contrasts(.data$Group)[,] <- .contr_fun(nlevels(.data$Group))
    lm(Value~Group, data=.data)
}
