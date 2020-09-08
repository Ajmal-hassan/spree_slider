module Spree::ProductDecorator
  def self.prepended(base)
    base.has_one :slide, dependent: :destroy
    base.after_update :destroy_slide_if_deleted
  end

  def destroy_slide_if_deleted
    slide.update_attributes(published: false) if slide && deleted_at
  end
end

Spree::Product.prepend Spree::ProductDecorator