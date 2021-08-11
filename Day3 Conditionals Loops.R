# Practicing conditionals and loops ----
## RScript does not knit

# Packages required
library(tidyverse)
library(palmerpenguins)

# Refresh boolean operators

pinyon_pine <- 14
lodgepole_pine <- 46
torrey_pine <- 50

pinyon_pine == 10
lodgepole_pine > pinyon_pine

pinyon_pine != 25

# Create basic if statements

burrito <- 2.4

if (burrito > 2) {
  print("i love burritos")
}

# If dataset had a community of scientist contributing to a database of species they had seen
## want to search for any whale type  (gray whale, blue whale, etc.)
## create a string match - stringr package is included in the tidyverse

sbc_observations <- c("blue whale", "gray whale", "whale", 
                     "gray wale", "dolphin", "sea lion", 
                     "blue whale")

str_detect(sbc_observations, pattern = "whale")

# An example of str_detect within a conditional statement

phrase <- "I really love data science!"

if (str_detect(phrase, "data")) {
  print("cool me, too.")
}

# If-else statements - if this is true, then do this, 
# if not do otherwise

pika <- 89

if (pika > 60) {
  print("Large pika")
} else {
  print("Small pika")
}

# Create a string `food <- "I love enchiladas!"`
# write an if-else statement that prints "Yay burritos"
# if the string burritos is detected in 'food', or prints
# "what about burritos" otherwise.

food <- "I love enchiladas!"

if (str_detect(food, pattern = "burritos")) {
  print("yay burritos!")
} else {
  print("What about burritos?")
}

food <- "I love veggis burritos!"

if (str_detect(food, pattern = "burritos")) {
  print("yay burritos!")
} else {
  print("What about burritos?")
}

if (str_detect(food, pattern = "burr")) {
  print("yay burritos!")
} else {
  print("What about burritos?")
}

# Create a new stored object called 'marmot' with a value of 2.8. Write an if - elseif - else statement that returns: "Small marmot" if marmot is less than 0.5. "medium marmot" if marmot is >= 0.5 AND 3, and "large marmot" if marmot is >=3. 

marmot <- 2.8

if (marmot < 0.5) {
  print("small marmot")
} else if (marmot >= 0.5 & marmot < 3) {
  print("medium marmot")
} else {
  print("large marmot")
}

if (marmot < 0.5) {
  print("small marmot")
} else if (marmot >= 0.5 & marmot < 3) {
  print("medium marmot")
} else if (marmot >= 3) {
  print("large marmot")
}

# Switch statement - what it returns depends on species, look at ?switch; a more concise way to write an if-else statement

species <- "elephant"

switch(species, 
       "cat" = print ("meow"),
       "lion" = print("roar"),
       "owl" = print("screech"),
       "fox" = print("obnoxious"),
       print("something else"))

# Mean bill length by species
penguin_summary <- penguins %>% 
  group_by(species, island) %>% 
  summarize(mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE),
  sd_bill_depth = sd(bill_depth_mm, na.rm = TRUE))
  
penguin_subset <- penguins %>% 
    filter(island == "Torgersen") %>% 
    select(species, flipper_length_mm, year)

# Now a for loops intro practice

animal <- c("cat", "dog", "dog", "cat", "zebra", "elephant")

for (i in seq_along(animal)) {
  
  if (animal[i] == "dog") {
    print("I love dogs!")
  } else {
    print("This is a different animal")
  }
  
}

# Create an output structure 

species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")
age_human <- c(3, 8, 4, 6, 12, 18)

animal_ages <- vector(mode = "numeric", length = length(species))

for (i in seq_along(species)) {
  if (species[i] == "dog") {
    animal_age <- age_human[i]*7
  } else if (species[i] == "elephant") {
    animal_age <- age_human[i] * 0.88
  } else if (species[i] == "goat") {
    animal_age <- age_human[i] * 4.7
  }
  animal_ages[i] <- animal_age
}

# Iterate over columns  - calculate the mean value of each column in a data frame

mean_mtcars <- vector(mode = "numeric", length = ncol(mtcars))

for (i in 1:ncol(mtcars)) {
  mean_val <- mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[i] <- mean_val
}

mean_mtcars

# Syntactic sugar - Apply!  Purrr!
apply(X = mtcars, 2, mean, na.rm = TRUE)

map_df(.x = mtcars, .f = mean)
  