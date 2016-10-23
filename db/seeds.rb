# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CharacterArchetype.delete_all
CharacterArchetype.reset_pk_sequence
JSON.parse(open("#{Rails.root}/doc/character_archetypes.json").read).each { |arc| CharacterArchetype.create(arc) }

Genre.delete_all
Genre.reset_pk_sequence
JSON.parse(open("#{Rails.root}/doc/genres.json").read).each { |genre| Genre.create(genre) }
