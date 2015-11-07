json.array!(@expenses) do |expense|
  json.extract! expense, :id, :name, :user_id
  json.url expense_url(expense, format: :json)
end
