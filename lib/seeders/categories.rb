module Seeders
  module Categories 

    class << self

      def seed
            categories.each do |attributes|
              category = Category.where(name: attributes[:name]).first
              if category.nil?
                category = Category.new
                category.name = attributes[:name]
              else
                category.update_attributes(attributes)
              end
              category.save!
          end
      end

      def categories
            [
              {
                name: "Foyer",
              },
              {
                name: "Living Room",
              },
              {
                name: "Hallway",
              },
              {
                name: "Bedroom",
              },
              {
                name: "Kitchen",
              },
              {
                name: "Bathroom",
              },
              {
                name: "Storage",
              },
            ]
      end
    end
  end
end