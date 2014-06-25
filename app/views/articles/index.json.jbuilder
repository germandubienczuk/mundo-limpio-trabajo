json.array!(@articles) do |article|
  json.extract! article, :id, :description, :price_cost, :price, :price_card, :bar_code, :category_id
  json.url article_url(article, format: :json)
end
