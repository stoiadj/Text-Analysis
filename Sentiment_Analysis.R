install.packages("tidytext")
library(tidytext)

sentence <- data.frame(sentence = "I like this sentence")

sentence_unnested <- sentence %>%
  unnest_tokens(word, sentence)

stop_words <- get_stopwords()

sentence_unnested <- sentence_unnested %>%
  filter(!word %in% stop_words$word)

sentiments <- get_sentiments()

sentiments_sentence <- sentence_unnested %>%
  left_join(sentiments, by="word")

nrow(filter(sentiments_sentence, sentiment=="positive")) / nrow(sentiments_sentence)

##############################################################

# https://raw.githubusercontent.com/stoiadj/Opinions/refs/heads/main/Opinions.csv

opinion <- read_csv("https://raw.githubusercontent.com/stoiadj/Opinions/refs/heads/main/Opinions.csv")


opinion <- opinion %>%
  mutate(Id = seq(1, nrow(opinion)),
         Opinion = str_replace_all(Opinion, "'", ""))


