namespace :crowdfunder do
  desc "Seeds tags"
  task :seed_tags => [:environment] do
      tag_list = ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5", "Tag 6"]
      tag_list.each do |tag|
        ActsAsTaggableOn::Tag.new(:name => tag).save
      end
      (1..100).each do |i|
        p = Project.find(i)
        5.times do 
          p.tag_list.add(tag_list.sample)
        end
        puts p.save
        end
  end
end