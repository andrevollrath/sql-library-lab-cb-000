def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books WHERE series_id = 1;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters JOIN (SELECT id, LENGTH(motto)
   AS len FROM characters) AS chr ON characters.id = chr.id ORDER BY
   len DESC LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS count FROM characters 
  GROUP BY species ORDER BY count DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors JOIN series ON authors.id 
  = series.author_id JOIN subgenres ON series.subgenre_id =
  subgenres.id; "
end

def select_series_title_with_most_human_characters
  "SELECT title FROM series JOIN(SELECT series_id, COUNT(species) AS count 
  FROM characters WHERE species = 'human' GROUP BY series_id ORDER BY count 
  DESC) AS human ON human.series_id = series.id LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name, count FROM characters JOIN( SELECT character_id, 
  COUNT(character_id) AS count FROM character_books GROUP BY character_id
  ) AS number ON characters.id = number.character_id ORDER BY count DESC, name ASC;"
end
