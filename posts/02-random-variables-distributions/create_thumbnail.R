# Create thumbnail for Random Variables and Distributions post
# Shows PMF (discrete) and PDF (continuous) side by side

library(ggplot2)
library(patchwork)

# Set theme
theme_set(theme_minimal(base_size = 14))

# Color palette - using the green from the site
green_primary <- "#166534"
green_light <- "#dcfce7"

# Left panel: PMF (Binomial distribution)
pmf_data <- data.frame(
  x = 0:10,
  prob = dbinom(0:10, size = 10, prob = 0.6)
)

p1 <- ggplot(pmf_data, aes(x = x, y = prob)) +
  geom_segment(aes(xend = x, yend = 0), color = green_primary, linewidth = 2) +
  geom_point(color = green_primary, size = 4) +
  labs(
    title = "Discrete (PMF)",
    subtitle = "Binomial(n=10, p=0.6)",
    x = "x",
    y = "P(X = x)"
  ) +
  scale_x_continuous(breaks = 0:10) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 20),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40", size = 14),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    axis.title = element_text(face = "bold")
  )

# Right panel: PDF (Normal distribution)
pdf_data <- data.frame(
  x = seq(-4, 4, length.out = 200)
)
pdf_data$density <- dnorm(pdf_data$x, mean = 0, sd = 1)

p2 <- ggplot(pdf_data, aes(x = x, y = density)) +
  geom_line(color = green_primary, linewidth = 2) +
  geom_area(fill = green_light, alpha = 0.5) +
  labs(
    title = "Continuous (PDF)",
    subtitle = "Normal(μ=0, σ²=1)",
    x = "x",
    y = "f(x)"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 20),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40", size = 14),
    panel.grid.minor = element_blank(),
    axis.title = element_text(face = "bold")
  )

# Combine plots
combined <- p1 + p2 +
  plot_annotation(
    title = "Random Variables & Distributions",
    theme = theme(
      plot.title = element_text(size = 24, face = "bold", hjust = 0.5,
                                family = "sans", margin = margin(b = 10))
    )
  )

# Save
ggsave(
  "thumbnail.png",
  combined,
  width = 12,
  height = 5,
  dpi = 300,
  bg = "white"
)

cat("Thumbnail created successfully!\n")
