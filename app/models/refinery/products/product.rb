require 'dragonfly'
require 'acts_as_indexed'

module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      ::Refinery::Products::Dragonfly.setup!

      default_scope order('position ASC')
      self.table_name = 'refinery_products'

      has_many :images, :class_name => ProductImage
      belongs_to :category, :foreign_key => 'category_id', :class_name => 'ProductCategory'

      include Images::Validators

      image_accessor :image

      attr_accessible :title, :description, :position, :image, :image_size, :category_id

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true
    end
  end
end
