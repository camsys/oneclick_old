namespace :oneclick do
  task :seed_data => :environment do
    u = User.create! first_name: 'Eric', last_name: 'Ziering'
    ['My house', 'My primary doctor', '--- Add a new place'].each do |place|
      u.places << Place.new(name: place)
      u.save!
    end
  end
end
