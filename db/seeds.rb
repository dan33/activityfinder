u1 = User.create(:name => 'Jack Jeffress', :email => 'jack@gmail.com', :gender => 'male', :password => 'jackjeffress', :password_confirmation => 'jackjeffress', :city => 'Sydney, Australia')
u2 = User.create(:name => 'Dan Addington', :email => 'dan@gmail.com', :gender => 'male', :password => 'danaddington', :password_confirmation => 'danaddington', :city => 'Sydney, Australia')
u3 = User.create(:name => 'Andrew O\'Brien', :email => 'andrew@gmail.com', :gender => 'male', :password => 'andrewobrien', :password_confirmation => 'andrewobrien', :city => 'Sydney, Australia')

c1 = Category.create(:title => 'Relaxation')
c2 = Category.create(:title => 'Exercise')
c3 = Category.create(:title => 'Work')
c4 = Category.create(:title => 'Eating / Drinking')
c5 = Category.create(:title => 'Other')

a1 = Activity.create(:title => 'Sailing', :description => 'Sailing in Pittwater', :longitude => '-33.650681', :latitude => '151.278647', :address => '50 Mccarrs Creek Road, Church Point', :category_id => 1)
a2 = Activity.create(:title => 'Bondi Yoga', :description => 'A yoga meet up at Bondi Beach', :longitude => '-33.891579', :latitude => '151.276092', :address => 'Bondi Beach', :category_id => 2)
a3 = Activity.create(:title => 'General Assembly', :description => 'Gotta get the code on', :longitude => '-33.880428', :latitude => '151.200219', :address => '608 Harris Street, Ultimo', :category_id => 3)
a4 = Activity.create(:title => 'Mojo Record Bar', :description => 'A pretty cool little place', :longitude => '-33.868376', :latitude => '151.205841', :address => '73 York Street, Sydney', :category_id => 4)
a5 = Activity.create(:title => 'Hotel Costes', :description => 'At some point along the bus route', :longitude => '-33.825311', :latitude => '151.233757', :address => '393 Military Road, Mosman', :category_id => 5)

m1 = Membership.create(:user_id => 1, :activity_id => 1, :role => 'owner')
m2 = Membership.create(:user_id => 2, :activity_id => 2, :role => 'owner')
m3 = Membership.create(:user_id => 3, :activity_id => 3, :role => 'owner')