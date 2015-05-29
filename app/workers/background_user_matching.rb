require 'matrix'
require 'tf-idf-similarity'
class BackgroundUserMatching
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(user_id)
    user_choices = UserChoice.find_by_user_id(user_id)
    

    # end
    # tags
    # [doc1, doc2, doc3].each { |doc| corpus << doc }
    # corpus.similar_documents(doc1).each do |doc, similarity|
    #  puts "Similarity between doc #{doc1.id} and doc #{doc.id} is #{similarity}"
    # end
    # Similarity between doc 70137042580340 and doc 70137042580340 is 0.9999999999999997
    # Similarity between doc 70137042580340 and doc 70137042580240 is 0.06068602112714361
    # Similarity between doc 70137042580340 and doc 70137042580160 is 0.04882114791611661

  end

end