require 'faker'
require 'mini_magick'

# Create sample products
50.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,                 # Random product title
    detail: Faker::Lorem.paragraph(sentence_count: 3), # Random product description
    price: Faker::Commerce.price(range: 10..1000.0, as_string: true) # Random product price
  )

  # Attach 3 random images for each product
  5.times do
    # fake_image = Faker::LoremPixel.image(width: 300, height: 300, is_gray: false)
    fake_image_url = Faker::LoremFlickr.image(size: "300x300", search_terms: ['product'])


    # Open the image using MiniMagick
    image = MiniMagick::Image.open(fake_image_url)

    # Save the image to a tempfile to upload it via ActiveStorage
    file = Tempfile.new(['image', '.png'])
    file.binmode
    file.write(image.to_blob)
    file.rewind

    # Attach the image to the product
    product.images.attach(io: file, filename: "#{Faker::Internet.uuid}.png")

    # Clean up the temp file
    file.close
    file.unlink
  end
end
