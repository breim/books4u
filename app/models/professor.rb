class Professor < ActiveRecord::Base

  # After and before validations
  include Searchable


  # Relations
  belongs_to :user

  has_many :courses, :dependent => :destroy
  accepts_nested_attributes_for :courses, :reject_if => :all_blank, :allow_destroy => true

  # Validations
  validates :email, presence: true
  validates :price, presence: true
  validates :semester, presence: true
  validates :major, presence: true
  validates :horario, presence: true
  validates :name, presence: true

  # PaperClip + ftp
  has_attached_file :image,:styles => {
    :large => "512x512" ,
    :medium => "200x200" ,
    :small => "168x168",
    :thumb => "40x40",
    :tiny => "32x32"
    },
    :url  => "/images/professor/:id-:basename.:style.:extension",
    :path => ":rails_root/public/images/professor/:id-:basename.:style.:extension",
    :default_url => :set_default_url

    validates :image, :attachment_presence => true
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates_attachment_size :image, :less_than => 10.megabytes

  # if user dont have image
  def set_default_url
    "/img/missing.png"
  end
  # End --- 

  # Gem socialization
  acts_as_likeable # Can be recomended
  acts_as_followable # Tricker for not recommended


  # FriendlyID Gem
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [:name,
      [:name, :id]
    ]
  end
  # end


end
