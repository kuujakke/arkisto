FactoryGirl.define do
  factory :image do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :image_jpeg, class: Image do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :image_png, class: Image do
    file "1489500739386.png"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :image_webp, class: Image do
    file "1489500739386.webp"
    source_url "https://www.asd.net/foo/bar"
  end
end