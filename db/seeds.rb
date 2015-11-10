# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
test_user = User.create(email: 'test@example.com', password: '12345678')
test_income_category = Category.create(name: 'test income category', record_type: 1, user_id: test_user.id)
test_expense_category = Category.create(name: 'test expense category', record_type: 0, user_id: test_user.id)
test_moneyrecord_income = Moneyrecord.create(name: 'test income money record', category_id: test_income_category.id, amount: 500)
test_moneyrecord_expense = Moneyrecord.create(name: 'test expense money record', category_id: test_expense_category.id, amount: 400)
