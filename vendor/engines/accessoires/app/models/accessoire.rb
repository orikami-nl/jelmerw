class Accessoire < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :afbeelding1, :class_name => 'Image'
  belongs_to :afbeelding2, :class_name => 'Image'
  belongs_to :afbeelding3, :class_name => 'Image'
  belongs_to :afbeelding4, :class_name => 'Image'
  belongs_to :afbeelding5, :class_name => 'Image'
  belongs_to :afbeelding6, :class_name => 'Image'
  belongs_to :afbeelding7, :class_name => 'Image'
end
