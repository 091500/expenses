json.array!(@moneyrecords) do |moneyrecord|
  json.extract! moneyrecord, :id, :name, :category_id
  json.url moneyrecord_url(moneyrecord, format: :json)
end
