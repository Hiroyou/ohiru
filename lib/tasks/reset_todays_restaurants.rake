namespace :reset do
  task :todays => :environment do
    r = Random.new
    User.all.each do |user|
      restaurants = Restaurant.find_all_by_user_id(user.id)
      index = r.rand(restaurants.size)
      user.todays_restaurant_id = restaurants[index].id
      user.save
    end
  end
end
