module Refinery
  module Products
    module Admin
      class ProductsController < ::Refinery::AdminController

        crudify :'refinery/products/product', :xhr_paging => true
        before_filter do @categories = Refinery::Products::ProductCategory.all end

        def update
          image = params[:product].delete 'image'

          @product = Product.find params[:id]
          @product.update_attributes params[:product]

          if image
            @product.images << ProductImage.new(:image => image)
            @product.save!
          end

          redirect_to :back
        end

      end
    end
  end
end
