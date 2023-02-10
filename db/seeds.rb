Dir[File.join(Rails.root, "db", "seeds", "*.rb")].sort.each do |seed|
  puts "[Seeding] - #{seed}. loading seeds, for real!"
  require seed
end

puts "Seeded..."