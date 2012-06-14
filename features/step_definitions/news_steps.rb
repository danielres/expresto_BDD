Given /^(?:a|an) (.*) news by (.*) with english body "(.*?)" and french body "(.*?)"$/ do |publish_state, user, body_en, body_fr|
  published_at = ( publish_state == 'published' ? Time.now : Time.now+1.day )
  u = User.find_by_name(user) || FactoryGirl.create(:user, :name => user)
  FactoryGirl.create(:news, :published_at => published_at, :author => u, :body_en => body_en, :body_fr => body_fr)
end
