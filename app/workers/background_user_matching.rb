require 'matrix'
require 'tf-idf-similarity'
class BackgroundUserMatching
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(user_id)
    user_choices = UserChoice.find_by_user_id(user_id)
    if user_choices && user_choices.tags && user_choices.tags.split(',').size >= 10
      docs = []
      doc_hash = {}
      counter = 1
      doc_hash[counter.to_s] = user_choices.user_id
      docs.push(TfIdfSimilarity::Document.new(user_choices.tags))
      counter += 1
      rest_choices = UserChoice.where(:user_id.ne => user_id).each do |x|
        if tags.split(',').size >= 10 
          doc_hash[counter.to_s] = x.user_id
          docs.push(TfIdfSimilarity::Document.new(x.tags))
          counter += 1
        end
      end
      doc_hash.each { |name, value| instance_variable_set("@#{name}", value) }
      corpus = docs
      model = TfIdfSimilarity::TfIdfModel.new(corpus)
      matrix = model.similarity_matrix
      result_user_ids = {}
      matrix[0, model.document_index(document2)]
      for i in 1...matrix.column_size()
         if matrix[0][i] > 0.3
          user_id = doc_hash[(i+1).to_s]
          result_user_ids[user_id.to_s] = matrix[0][i]*100
         end
      end
      # BackgroundImageProcessor.perform_async(user_id)

      # document_1 = TfIdfSimilarity::Document.new("Lorem ipsum dolor sit amet...")
      # document_2 = TfIdfSimilarity::Document.new("Pellentesque sed ipsum dui...")
      # document3 = TfIdfSimilarity::Document.new("Nam scelerisque dui sed leo...")
      # corpus = [document1, document2, document3]
    end
  end

end