# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |x|
	Topic.create!(
		title: "Topic #{ x + 1 }"
	)
end
puts '3 topics created!'

User.create!(email: 'a@a.a', name: 'aa aa', password: 'aaaaaa', role: 'site_admin')
User.create!(email: 'b@b.b', name: 'bb bb', password: 'bbbbbb', role: '')

10.times do |x|
	Blog.create!(
		title: "My Blog Post #{ x.next }",
		body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
		topic_id: Topic.last.id
	)
end
puts 'Created 10 Blogs'

5.times do |x|
	Skill.create!(
		title: "Rails #{ x.next }", percent_utilized: rand(50..100)
	)
end
puts 'Created 5 Skills'

8.times do |x|
	Portfolio.create!(
		title: "Portfolio #{ x }",
		subtitle: "Ruby on Rails",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		main_image: "https://i.imgur.com/vQfNBFJ.gif",
		thumb_image: "https://i.imgur.com/DXOkOtm.jpg"
	)
end

Portfolio.create!(
	title: "Portfolio 9",
	subtitle: "Angular",
	body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
	main_image: "https://i.imgur.com/oTC6K8S.jpg",
	thumb_image: "https://i.imgur.com/t3avudb.jpg"
)
puts "Created 9 Portfolios"

3.times do |x|
	# Technology.create!(
	# 	name: "Technology #{ x + 1 }",
	# 	portfolio_id: Portfolio.last.id
	# )

	Portfolio.last.technologies.create!(
		name: "Technology #{ x + 1 }",
		portfolio_id: Portfolio.last.id
	)
end
puts 'Created 3 Technologies'
