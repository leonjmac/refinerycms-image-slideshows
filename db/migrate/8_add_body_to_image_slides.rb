class AddBodyToImageSlides < ActiveRecord::Migration
  def up
    Refinery::ImageSlideshows::ImageSlide.add_translation_fields! body: :text
  end
  def down
    remove_column :refinery_image_slide_translations, :body
  end
end