### Tradicional ###
library(tidyverse)

data <- read.csv("data/results.csv")
#print(data)

data_long <- data %>%
  pivot_longer(cols = c(Tradicional, DR1, DR2), names_to = "Algorithm", values_to = "Time")

plot_traditional <- ggplot(data, aes(x = n, y = Tradicional, color = "Tradicional")) + 
  geom_point(size = 2.5, show.legend = TRUE) +     
  geom_line() +                     
  scale_x_continuous(trans = "log10", 
                     breaks = c(32, 64, 128, 256, 512, 1024), 
                     labels = scales::comma,
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(2.1:3.1), "*")
                     }) +  
  scale_y_continuous(trans = "log10", 
                     breaks = 10^(0:5), limits = c(1, 1000000), 
                     labels = scales::trans_format("log10", scales::math_format(10^.x)),
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(-0.1:3.1), "*")
                     }) + 
  labs(
    title = "Comportamiento Asintótico del algoritmo Tradicional", 
    x = "Tamaño de Input (n)",
    y = "Tiempo de Ejecución (ms)",
    color = NULL   
  ) +
  scale_color_manual(values = c("Tradicional" = "red"), labels = "Tradicional") +    
  theme_classic() +     
  theme(
    axis.title = element_text(size = 12, family = "serif"),    
    axis.text = element_text(size = 11, family = "serif"),    
    plot.title = element_text(hjust = 0.5, size = 14, family = "serif"), 
    plot.margin = margin(20, 20, 20, 20),                     
    aspect.ratio = 1,                                         
    legend.position = c(0.05, 0.95),                        
    legend.justification = c("left", "top"),
    legend.key = element_rect(fill = "white"),
    legend.text = element_text(size = 12, family = "serif"),
    panel.border = element_rect(color = "black", fill = NA)  
  ) +
  guides(color = guide_legend(override.aes = list(size = 1))) +
  
  annotation_custom(grid::segmentsGrob(x0 = unit(0, "npc"), x1 = unit(0.02, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(1, "npc"), x1 = unit(0.98, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(0, "npc"), y1 = unit(0.02, "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(1, "npc"), y1 = unit(0.98, "npc")))

print(plot_traditional)

### DR1 ###
library(tidyverse)

data <- read.csv("data/results.csv")
#print(data)

data_long <- data %>%
  pivot_longer(cols = c(DR1, DR2), names_to = "Algorithm", values_to = "Time")

plot_DR1 <- ggplot(data, aes(x = n, y = DR1, color = "DR1")) + 
  geom_point(size = 2.5, show.legend = TRUE) +     
  geom_line() +                     
  scale_x_continuous(trans = "log10", 
                     breaks = c(32, 64, 128, 256, 512, 1024), 
                     labels = scales::comma,
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(2.1:3.1), "*")
                     }) +  
  scale_y_continuous(trans = "log10", 
                     breaks = 10^(0:5), limits = c(1, 1000000), 
                     labels = scales::trans_format("log10", scales::math_format(10^.x)),
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(-0.1:3.1), "*")
                     }) + 
  labs(
    title = "Comportamiento Asintótico de DR1", 
    x = "Tamaño de Input (n)",
    y = "Tiempo de Ejecución (ms)",
    color = NULL   
  ) +
  scale_color_manual(values = c("DR1" = "blue"), labels = "DR1") +    
  theme_classic() +     
  theme(
    axis.title = element_text(size = 12, family = "serif"),    
    axis.text = element_text(size = 11, family = "serif"),    
    plot.title = element_text(hjust = 0.5, size = 14, family = "serif"), 
    plot.margin = margin(20, 20, 20, 20),                     
    aspect.ratio = 1,                                         
    legend.position = c(0.05, 0.95),                        
    legend.justification = c("left", "top"),
    legend.key = element_rect(fill = "white"),
    legend.text = element_text(size = 12, family = "serif"),
    panel.border = element_rect(color = "black", fill = NA)  
  ) +
  guides(color = guide_legend(override.aes = list(size = 1))) +

  annotation_custom(grid::segmentsGrob(x0 = unit(0, "npc"), x1 = unit(0.02, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(1, "npc"), x1 = unit(0.98, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(0, "npc"), y1 = unit(0.02, "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(1, "npc"), y1 = unit(0.98, "npc")))

print(plot_DR1)

### DR2 ###
data <- read.csv("data/results.csv")
#print(data)

data_long <- data %>%
  pivot_longer(cols = c(DR1, DR2), names_to = "Algorithm", values_to = "Time")

plot_DR2 <- ggplot(data, aes(x = n, y = DR2, color = "DR2")) +
  geom_point(size = 2.5, show.legend = TRUE) +     
  geom_line() +                     
  scale_x_continuous(trans = "log10", 
                     breaks = c(32, 64, 128, 256, 512, 1024), 
                     labels = scales::comma,
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(2.1:3.1), "*")
                     }) +  
  scale_y_continuous(trans = "log10", 
                     breaks = 10^(0:5), limits = c(1, 1000000), 
                     labels = scales::trans_format("log10", scales::math_format(10^.x)),
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(-0.1:3.1), "*")
                     }) + 
  labs(
    title = "Comportamiento Asintótico de DR2",
    x = "Tamaño de Input (n)",
    y = "Tiempo de Ejecución (ms)",
    color = NULL
  ) +
  scale_color_manual(values = c("DR2" = "skyblue"), labels = "DR2") +
  theme_classic() +     
  theme(
    axis.title = element_text(size = 12, family = "serif"),    
    axis.text = element_text(size = 11, family = "serif"),    
    plot.title = element_text(hjust = 0.5, size = 14, family = "serif"), 
    plot.margin = margin(20, 20, 20, 20),                     
    aspect.ratio = 1,                                         
    legend.position = c(0.05, 0.95),                        
    legend.justification = c("left", "top"),
    legend.key = element_rect(fill = "white"),
    legend.text = element_text(size = 12, family = "serif"),
    panel.border = element_rect(color = "black", fill = NA)  
  ) +
  guides(color = guide_legend(override.aes = list(size = 1))) +

  annotation_custom(grid::segmentsGrob(x0 = unit(0, "npc"), x1 = unit(0.02, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(1, "npc"), x1 = unit(0.98, "npc"), 
                                       y0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(0, "npc"), y1 = unit(0.02, "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       x1 = unit(c(0.15, 0.425, 0.675, 0.85), "npc"), 
                                       y0 = unit(1, "npc"), y1 = unit(0.98, "npc")))

print(plot_DR2)


### DR1 and DR2 ###
data <- read.csv("data/results.csv")
#print(data)

data_long <- data %>%
  pivot_longer(cols = c(DR1, DR2), names_to = "Algorithm", values_to = "Time")

plot_DR1_DR2 <- ggplot(data_long, aes(x = n, y = Time, color = Algorithm)) +
  geom_point(size = 2.5) +          
  geom_line() +                     
  scale_x_continuous(trans = "log10", 
                     breaks = c(32, 64, 128, 256, 512, 1024), 
                     labels = scales::comma,
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(2.1:3.1), "*")
                     }) +  
  scale_y_continuous(trans = "log10", 
                     breaks = 10^(0:5), limits = c(1, 10000), 
                     labels = scales::trans_format("log10", scales::math_format(10^.x)),
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(-0.1:3.1), "*")
                     }) + 
  labs(
    title = "Comportamiento Asintótico de DR1 y DR2",
    x = "Tamaño de Input (n)",
    y = "Tiempo de Ejecución (ms)",
    color = ""   
  ) +
  scale_color_manual(values = c("DR1" = "blue", "DR2" = "skyblue"), labels = c("DR1", "DR2")) +
  theme_classic() +     
  theme(
    axis.title = element_text(size = 12, family = "serif"),    
    axis.text = element_text(size = 11, family = "serif"),    
    plot.title = element_text(hjust = 0.5, size = 14, family = "serif"), 
    plot.margin = margin(20, 20, 20, 20),                     
    aspect.ratio = 1,                                         
    legend.position = c(0.05, 0.95),                        
    legend.justification = c("left", "top"),
    legend.key = element_rect(fill = "white"),
    legend.text = element_text(size = 12, family = "serif"),
    panel.border = element_rect(color = "black", fill = NA)  
  ) +
  guides(color = guide_legend(override.aes = list(size = 1))) +

  annotation_custom(grid::segmentsGrob(x0 = unit(0, "npc"), x1 = unit(0.02, "npc"), y0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y1 = unit(seq(0.1, 0.9, by = 0.1), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(1, "npc"), x1 = unit(0.98, "npc"), y0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y1 = unit(seq(0.1, 0.9, by = 0.1), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), x1 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y0 = unit(0, "npc"), y1 = unit(0.02, "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), x1 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y0 = unit(1, "npc"), y1 = unit(0.98, "npc")))

print(plot_DR1_DR2)

### Traditional, DR1 and DR2 ###
data <- read.csv("data/results.csv")
#print(data)

data_long <- data %>%
  pivot_longer(cols = c(Tradicional, DR1, DR2), names_to = "Algorithm", values_to = "Time")

traditional_DR1_DR2_plot <- ggplot(data_long, aes(x = n, y = Time, color = Algorithm)) +
  geom_point(size = 2.5) +          
  geom_line() +                     
  scale_x_continuous(trans = "log10", 
                     breaks = c(32, 64, 128, 256, 512, 1024), 
                     labels = scales::comma,
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(2.1:3.1), "*")
                     }) +  
  scale_y_continuous(trans = "log10", 
                     breaks = 10^(0:5), limits = c(1, 10000000), 
                     labels = scales::trans_format("log10", scales::math_format(10^.x)),
                     minor_breaks = function(limits) {
                       outer(1:9, 10^(-0.1:3.1), "*")
                     }) + 
  labs(
    title = "Comportamiento Asintótico de Tradicional, DR1 y DR2",
    x = "Tamaño de Input (n)",
    y = "Tiempo de Ejecución (ms)",
    color = ""   
  ) +
  scale_color_manual(values = c("Tradicional" = "red", "DR1" = "blue", "DR2" = "skyblue"))  +
  theme_classic() +     
  theme(
    axis.title = element_text(size = 12, family = "serif"),    
    axis.text = element_text(size = 11, family = "serif"),    
    plot.title = element_text(hjust = 0.5, size = 14, family = "serif"), 
    plot.margin = margin(20, 20, 20, 20),                     
    aspect.ratio = 1,                                         
    legend.position = c(0.05, 0.95),                        
    legend.justification = c("left", "top"),
    legend.key = element_rect(fill = "white"),
    legend.text = element_text(size = 12, family = "serif"),
    panel.border = element_rect(color = "black", fill = NA)  
  ) +
  guides(color = guide_legend(override.aes = list(size = 1))) +
  
  annotation_custom(grid::segmentsGrob(x0 = unit(0, "npc"), x1 = unit(0.02, "npc"), y0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y1 = unit(seq(0.1, 0.9, by = 0.1), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(1, "npc"), x1 = unit(0.98, "npc"), y0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y1 = unit(seq(0.1, 0.9, by = 0.1), "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), x1 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y0 = unit(0, "npc"), y1 = unit(0.02, "npc"))) +
  annotation_custom(grid::segmentsGrob(x0 = unit(seq(0.1, 0.9, by = 0.1), "npc"), x1 = unit(seq(0.1, 0.9, by = 0.1), "npc"), y0 = unit(1, "npc"), y1 = unit(0.98, "npc")))

print(traditional_DR1_DR2_plot)