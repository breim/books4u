module Searchable
	extend ActiveSupport::Concern

	included do
    	after_save :create_search
    	after_destroy :destroy_search
  	end


	# Automatic "Searchable method and table for all classes by: breim"
	def create_search
		@search = Search.where(:search_id => self.id,:search_model => self.class.name).first
		unless @search.present?
			@search = Search.new
			@search.name = self.name
			@search.search_id = self.id
			@search.search_model = self.class.name
			@search.save!
		else
			@search.name = self.name
			@search.save!
		end
	end

	def destroy_search
		@search = Search.where(:search_id => self.id,:search_model => self.class.name).first
		@search.destroy!
	end


end