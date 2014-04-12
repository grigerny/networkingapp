json.array!(@group_pages) do |group_page|
  json.extract! group_page, :id
  json.url group_page_url(group_page, format: :json)
end
