# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

if DatabaseCleaner.clean_with(:truncation)

	@dp = DataParent.new
	@dp.name = 'settings'
	@dp.save

	@dc = DataChild.new
	@dc.data_parent_id = 1
	@dc.name = 'theme'
	@dc.v = 'default-theme'
	@dc.input_type = 'select'
	@dc.options_from = 'get_options'
	@dc.save!

end