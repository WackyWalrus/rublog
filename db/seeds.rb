# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

if DatabaseCleaner.clean_with(:truncation)

	DataParent.create(name: 'settings')

	DataChild.create([
		{
			data_parent_id: 1,
			name: 'blog title',
			v: 'rublog',
			input_type: 'text'
		},
		{
			data_parent_id: 1,
			name: 'blog description',
			v: 'description goes here',
			input_type: 'textarea'
		},
		{
			data_parent_id: 1,
			name: 'theme',
			v: 'default-theme',
			input_type: 'select',
			options_from: 'get_options'
		},
		{
			data_parent_id: 1,
			name: 'header image',
			v: '',
			input_type: 'image'
		},
		{
			data_parent_id: 1,
			name: 'logo image',
			v: '',
			input_type: 'image'
		}
	])

end