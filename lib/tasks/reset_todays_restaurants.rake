namespace :reset do
  task :todays => :environment do

    r = Random.new
    User.all.each do |user|
      restaurants = Restaurant.find_all_by_user_id(user.id)
      next if restaurants.blank?

      index = r.rand(restaurants.size)
      user.todays_restaurant_id = restaurants[index].id
      user.save
    end

    User.all.each do |user|
      restaurants = Restaurant.find_all_by_user_id(user.id)
      next if restaurants.blank?

      MasterMailer.daily(user).deliver
    end
  end
end
