class PhraseParser

  attr_accessor :text_blob, :phrases_to_be_made

  def initialize(text_blob_for_phrases)
    self.text_blob = text_blob_for_phrases
    self.phrases_to_be_made = separate_the_content
  end

  def separate_the_content
    text_blob.split("\n")
  end

end




#@array_of_unmade_tasks = @project.the_initial_blob_to_parse.scan(/\b(t:)(.*?)(:e)\b/i).collect do |the_task, the_content, the_end|
#       @array_of_tasks_to_be = []
#       @array_of_tasks_to_be << the_content.to_s
#     end
#     @array_of_unmade_tasks.each do |make_this_a_task|
#       Task.find_or_create_by(project_id: @project.id, the_action_description: "#{make_this_a_task}", comment_or_measure: "you must change this to continue.", golem: "questions incomplete")
#array_of_uncategorized_phrases = []
#text_blob.scan(/\S.*\n?/) do |line|
#  array_of_uncategorized_phrases << line
#  array_of_uncategorized_phrases
