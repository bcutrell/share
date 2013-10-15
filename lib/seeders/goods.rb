module Seeders
  module Goods

    class << self

      def seed
            goods.each do |attributes|
              good = Good.where(title: attributes[:title]).first
              category = Category.where(name: attributes[:categories]).first
              if good.nil?
                good = Good.new
                good.title = attributes[:title]
                good.location = attributes[:location]
                good.description = attributes[:description]
                good.user = attributes[:user]
                image = File.open(File.join(Rails.root, attributes[:image]))
                good.image = image
                if category != nil
                  good.categories << category
                end
              end
              good.save!
          end
      end

      def user
        User.where(email: "bcutrell13@gmail.com").first
      end

      def goods
            [
              {
                title: "Baby Table",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "For Babies!",
                user: user,
                image: "/app/assets/images/baby_table.jpg",
                categories: "Bedroom"
              },
              {
                title: "Bacon Machine",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Dream come true!",
                user: user,
                image: "/app/assets/images/bacon_machine.png",
                categories: "Kitchen"
              },
              {
                title: "Bacon Towel",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "God bless America",
                user: user,
                image: "/app/assets/images/bed_side_table.jpg",
                categories: "Bathroom"
              },
              {
                title: "Nice Chair",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Good for sitting",
                user: user,
                image: "/app/assets/images/chair.jpg",
                categories: "Living Room"
              },
              {
                title: "Changing Table",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "For Babies!",
                user: user,
                image: "/app/assets/images/changing_table.jpg",
                categories: "Bedroom"
              },
              {
                title: "Dark Couch",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Classy",
                user: user,
                image: "/app/assets/images/dark_couch.jpeg",
                categories: "Living Room"
              },
              {
                title: "Awesome Toliet",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Fish Toliet",
                user: user,
                image: "/app/assets/images/fish_toliet.jpg",
                categories: "Bathroom"
              },
              {
                title: "Patriots bean bag",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Where was this when I was growing up",
                user: user,
                image: "/app/assets/images/pats_bean_bag.jpg",
                categories: "Living Room"
              },
              {
                title: "Patriots Chair",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Comfy",
                user: user,
                image: "/app/assets/images/pats_chair.jpg",
                categories: "Living Room"
              },
              {
                title: "Pats Tissue Box",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "gesundheit",
                user: user,
                image: "/app/assets/images/pats_tissue_box.jpeg",
                categories: "Foyer"
              },
              {
                title: "Sandwhich Chair",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Yummy",
                user: user,
                image: "/app/assets/images/sandwhich_char.jpg",
                categories: "Living Room"
              },
              {
                title: "Star Wars",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "Epic",
                user: user,
                image: "/app/assets/images/star_wars_kitchen.jpg",
                categories: "Kitchen"
              },
              {
                title: "Legendary Table",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "There is not try",
                user: user,
                image: "/app/assets/images/star_wars_table.jpg",
                categories: "Kitchen"
              },
              {
                title: "Toaster",
                location: "1 Patriot Pl, Foxboro, MA",
                description: "A must",
                user: user,
                image: "/app/assets/images/toaster.jpg",
                categories: "Kitchen"
              },                 
            ]
      end

    end
  end
end