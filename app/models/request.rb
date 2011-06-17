class Request < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :owner, :class_name=>"User", :foreign_key=>"owner_id"
  
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true
  
  default_scope :order => 'requests.created_at DESC'
end
