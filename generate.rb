50.times do
  email = FFaker::Internet.email
  name = FFaker::Name.name
  user = {
    name: name,
    github: FFaker::Lorem.word,
    email: email,
    key: "ssh-rsa AAAAB#{SecureRandom.base64(366)} #{email}",
    external: [true, false].sample
  }.to_yaml.gsub("\n:", "\n")
  File.open("yml/#{name.downcase.gsub(' ', '.').gsub("'", '')}.yml", 'w') do |f|
    f.write(user)
    f.close
  end
end

50.times do
  email = "#{FFaker::Lorem.word}@organisation.com"
  name = FFaker::Lorem.word
  project = {
    display_name: name,
    description: FFaker::Lorem.paragraph,
    slack_project_channel_name: "project-#{name}",
    slack_client_channel_name: "client-#{name}",
    project_email: email,
  }.to_yaml.gsub("\n:", "\n")
  File.open("yml/projects/#{name.downcase.gsub(' ', '.').gsub("'", '')}.yml", 'w') do |f|
    f.write(project)
    f.close
  end
end
