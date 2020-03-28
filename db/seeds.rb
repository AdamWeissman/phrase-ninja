# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#phrase_score_list = [
#  [ "I can say this from memory.", 388.0],
#  [ "I can sort of say this from memory.", 377.0],
#  [ "I can't say this from memory.", 367.0],
#  [ "I can read the Japanese characters out loud.", 183.0],
#  [ "I struggle to sight read the Japanese characters out loud.", 173.0],
#  [ "I can't read the Japanese at all.", 163.0],
#  [ "I can read the phonetic English out loud.", 81.0],
#  [ "I struggle to read the phonetic English out loud.", 71.0],
#  [ "I can't read the phonetic English.", 61.0],
#  [ "I'd understand this phrase if someone spoke it to me as if I said it myself.", 30.0],
#  [ "I'd understand the gist of this phrase if it were spoken to me, but could not produce it.", 20.0],
#  [ "I would not recognize this sentence if it were spoken to me.", 10.0],
#]

#phrase_score_list.each do |familiarity, points|
#  PhraseScore.create( familiarity_name: familiarity, familiarity_name_corresponding_points: points)
#end

score_list = [
  [ "I totally know this.", 89.0],
  [ "It's familiar.", 55.0],
  [ "I feel optimistic.", 34.0],
  [ "I feel pessimistic.", 21.0],
  [ "It's unfamiliar.", 13.0],
  [ "I don't know this at all.", 8.0]
]

score_list.each do |familiarity, points|
  Score.create( familiarity_name: familiarity, familiarity_name_corresponding_points: points)
end
