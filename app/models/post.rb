class Post < ApplicationRecord
  validates_presence_of :page, :content

  validates :page,
    :inclusion  => { :in => [ 'how_to', 'about', 'links', 'new_arrivals' ],
    :message    => "%{value} is not a valid page" }

    rails_admin do
      create do
        field :page, :enum do
          enum do
            [['how_to'], ['about'], ['links'], ['new_arrivals']]
          end
        end
        field :content, :text
      end
    end

  scope :page_posts, -> (page) do
    where("page like ?", "#{page}")
  end
end
