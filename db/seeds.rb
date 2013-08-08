User.destroy_all
Category.destroy_all
Activity.destroy_all
Membership.destroy_all

u1 = User.create(:name => 'Jack Jeffress', :email => 'jack@gmail.com', :gender => 'male', :password => 'jackjeffress', :password_confirmation => 'jackjeffress', :city => 'Sydney, Australia', :image => File.open("/Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/jackjeffress.jpg"))
u2 = User.create(:name => 'Dan Addington', :email => 'dan@gmail.com', :gender => 'male', :password => 'danaddington', :password_confirmation => 'danaddington', :city => 'Sydney, Australia', :image => File.open("/Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/danaddington.jpg"))
u3 = User.create(:name => 'Andrew OBrien', :email => 'andrew@gmail.com', :gender => 'male', :password => 'andrewobrien', :password_confirmation => 'andrewobrien', :city => 'Sydney, Australia', :image => File.open("/Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/andrewobrian.jpg"))

c1 = Category.create(:title => 'Relaxation', :image => File.open("Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/leaf-green.png"))
c2 = Category.create(:title => 'Exercise', :image => File.open("Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/leaf-orange.png"))
c3 = Category.create(:title => 'Work', :image => File.open("Users/danieladdington/Projects/wdi/week_7/activityfinder/app/assets/images/leaf-red.png"))
c4 = Category.create(:title => 'Eating / Drinking')
c5 = Category.create(:title => 'Other')

a1 = Activity.create(:title => 'Pittwater Sailing', :description => 'We meet every Saturday to go sailing around Pittwater', :longitude => '-33.650681', :latitude => '151.278647', :address => '50 Mccarrs Creek Road, Church Point', :category_id => c1.id)
a2 = Activity.create(:title => 'Bondi Yoga', :description => 'A yoga meet up at Bondi Beach', :longitude => '-33.891579', :latitude => '151.276092', :address => 'Bondi Beach', :category_id => c2.id)
a3 = Activity.create(:title => 'Coding for fun', :description => 'A group of aspiring developers who meet up monthly to build stuff.', :longitude => '-33.880428', :latitude => '151.200219', :address => '608 Harris Street, Ultimo', :category_id => c3.id)
a4 = Activity.create(:title => 'Mojo Record Bar', :description => 'A group who meets up every Friday night to talk about music.', :longitude => '-33.868376', :latitude => '151.205841', :address => '73 York Street, Sydney', :category_id => c4.id)
a5 = Activity.create(:title => 'Foot Soldiers', :description => 'Do you like casual walking in the mornings before walk? If so join our group and meet new friends.', :longitude => '-33.825311', :latitude => '151.233757', :address => '393 Military Road, Mosman', :category_id => c5.id)

# m1 = Membership.create(:user_id => 1, :activity_id => 1, :role => 'owner')
# m2 = Membership.create(:user_id => 2, :activity_id => 2, :role => 'owner')
# m3 = Membership.create(:user_id => 3, :activity_id => 3, :role => 'owner')
# m4 = Membership.create(:user_id => 2, :activity_id => 4, :role => 'owner')
# m5 = Membership.create(:user_id => 3, :activity_id => 5, :role => 'owner')

u1.activities << a1 << a2 << a3 << a4 << a5
u1.save
u2.activities << a1 << a2 << a3 << a4 << a5
u2.save
u3.activities << a1 << a2 << a3 << a4 << a5
u3.save

u1.memberships[0].role = "owner"
u1.memberships[0].save
u1.memberships[1].role = "owner"
u1.memberships[1].save
u1.memberships[2].role = "owner"
u1.memberships[2].save
u1.memberships[3].role = "owner"
u1.memberships[3].save
u1.memberships[4].role = "owner"
u1.memberships[4].save
