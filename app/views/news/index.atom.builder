atom_feed do |feed|
  feed.title("Company Name Atom Feed")
  feed.updated(@news.first.created_at)
  for news in @news
    feed.entry(news) do |entry|
      entry.title(news.title)
      entry.content(news.content, :type => 'html' )
      entry.author { |author| author.name("Company Name") }
    end
  end
end