class Search < ActiveRecord::Base
	#Search
	searchkick autocomplete: ['name']

	def search_data
		as_json only: [:name, :id]
    	{
    		name: name,
    		id: id
    	}
    end
end
