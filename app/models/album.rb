class Album < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :order_items, dependent: :destroy

  validates :title, :artist, :price, :category, :catalog, presence: true
  validates :price, numericality: true

  scope :category, -> (input) {
    if input != "all"
      where("category like ?", "#{input}")
    else
      Album.all
    end
  }

  scope :category_title, -> (input) {
    if input === "mrecs"
      "Mississippi Records Vinyl"
    elsif input === "distro"
      "Distributed Vinyl"
    elsif input === "mcass"
      "Mississippi Records Cassettes"
    elsif input === "dcass"
      "Distributed Cassettes"
    else
      "Other"
    end
  }

  scope :search, -> (query) do
    albums = Album.all
    albums.find_all do |album|
      album.title.downcase.match("#{query.downcase}") ||
      album.artist.downcase.match("#{query.downcase}")
    end
  end

end
