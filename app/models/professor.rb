class Professor < ActiveRecord::Base
  # Relations
  belongs_to :user
end
