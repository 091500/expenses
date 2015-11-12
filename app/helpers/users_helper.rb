module UsersHelper

  def current_user_balance

    moneyrecords = Moneyrecord.where(category_id: current_user.categories {|i| i.id})
    sum_income = 0
    sum_expense = 0

    moneyrecords.each do |moneyrecord|
      sum_income += moneyrecord.amount if moneyrecord.category.record_type == 1 and !moneyrecord.amount.nil?
      sum_expense += moneyrecord.amount if moneyrecord.category.record_type == 0 and !moneyrecord.amount.nil?

    end

    total = sum_income-sum_expense

  end

end
