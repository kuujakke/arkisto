FactoryGirl.define do
  factory :image do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :image_jpeg, class: Image do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
end