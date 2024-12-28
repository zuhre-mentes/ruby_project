# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Roles
Role.create(name: 'student', description: 'Student user')
Role.create(name: 'teacher', description: 'Teacher user')

# Badge Categories
cloud_computing = BadgeCategory.find_or_create_by(name: 'Cloud Computing')
programming_languages = BadgeCategory.find_or_create_by(name: 'Programming Languages')
project_management = BadgeCategory.find_or_create_by(name: 'Project Management')
cybersecurity = BadgeCategory.find_or_create_by(name: 'Cybersecurity')
systems_administration = BadgeCategory.find_or_create_by(name: 'Systems Administration')
software_development = BadgeCategory.find_or_create_by(name: 'Software Development')
mobile_development = BadgeCategory.find_or_create_by(name: 'Mobile Development')
networking = BadgeCategory.find_or_create_by(name: 'Networking')

# Popular Programming Badges
Badge.create([
  { name: 'Certified Kubernetes Administrator (CKA)', description: 'Kubernetes certification for administrators.', badge_category: cloud_computing, issued_by: 'The Linux Foundation' },
  { name: 'Oracle Certified Professional (OCP) Java SE Programmer', description: 'Java programming certification.', badge_category: programming_languages, issued_by: 'Oracle' },
  { name: 'Microsoft Certified: Azure Developer Associate', description: 'Azure cloud developer certification.', badge_category: cloud_computing, issued_by: 'Microsoft' },
  { name: 'AWS Certified Developer – Associate', description: 'AWS cloud developer certification.', badge_category: cloud_computing, issued_by: 'AWS' },
  { name: 'Google Professional Cloud Developer', description: 'Google Cloud developer certification.', badge_category: cloud_computing, issued_by: 'Google Cloud' },
  { name: 'Certified ScrumMaster® (CSM)', description: 'Scrum project management certification.', badge_category: project_management, issued_by: 'Scrum Alliance' },
  { name: 'Professional Scrum Developer I (PSD I)', description: 'Scrum developer certification.', badge_category: project_management, issued_by: 'Scrum.org' },
  { name: 'Certified Secure Software Lifecycle Professional (CSSLP)', description: 'Cybersecurity certification for software developers.', badge_category: cybersecurity, issued_by: '(ISC)²' },
  { name: 'Red Hat Certified Engineer (RHCE)', description: 'Linux systems administration certification.', badge_category: systems_administration, issued_by: 'Red Hat' },
  { name: 'Certified Software Development Professional (CSDP)', description: 'Software development certification.', badge_category: software_development, issued_by: 'IEEE Computer Society' },
  { name: 'Microsoft Certified Solutions Developer (MCSD)', description: 'Microsoft software development certification.', badge_category: software_development, issued_by: 'Microsoft' },
  { name: 'AWS Certified Solutions Architect – Associate', description: 'AWS cloud architect certification.', badge_category: cloud_computing, issued_by: 'AWS' },
  { name: 'Google Associate Android Developer', description: 'Android development certification.', badge_category: mobile_development, issued_by: 'Google' },
  { name: 'Cisco Certified Network Associate (CCNA)', description: 'Networking certification by Cisco.', badge_category: networking, issued_by: 'Cisco' },
  { name: 'CompTIA Security+', description: 'Cybersecurity certification by CompTIA.', badge_category: cybersecurity, issued_by: 'CompTIA' },
  { name: 'Certified Ethical Hacker (CEH)', description: 'Ethical hacking certification.', badge_category: cybersecurity, issued_by: 'EC-Council' },
  { name: 'Certified Information Systems Security Professional (CISSP)', description: 'Cybersecurity certification.', badge_category: cybersecurity, issued_by: '(ISC)²' },
  { name: 'Google Certified Professional Data Engineer', description: 'Google Cloud data engineering certification.', badge_category: cloud_computing, issued_by: 'Google Cloud' },
  { name: 'PMP: Project Management Professional', description: 'Project management certification.', badge_category: project_management, issued_by: 'PMI' },
  { name: 'Certified Data Professional (CDP)', description: 'Data professional certification.', badge_category: software_development, issued_by: 'ICCP' },
  { name: 'Docker Certified Associate (DCA)', description: 'Docker container certification.', badge_category: cloud_computing, issued_by: 'Docker' },
  { name: 'Certified JavaScript Developer', description: 'JavaScript programming certification.', badge_category: programming_languages, issued_by: 'JavaScript Institute' },
  { name: 'Unity Certified Developer', description: 'Game development certification using Unity.', badge_category: software_development, issued_by: 'Unity Technologies' },
  { name: 'Certified PHP Engineer', description: 'PHP programming certification.', badge_category: programming_languages, issued_by: 'Zend Technologies' },
  { name: 'Certified Python Developer', description: 'Python programming certification.', badge_category: programming_languages, issued_by: 'Python Institute' },
  { name: 'Microsoft Certified: Power Platform Developer Associate', description: 'Power Platform certification.', badge_category: software_development, issued_by: 'Microsoft' },
  { name: 'AWS Certified Machine Learning – Specialty', description: 'AWS machine learning certification.', badge_category: cloud_computing, issued_by: 'AWS' },
  { name: 'Microsoft Certified: Azure AI Engineer Associate', description: 'AI engineering certification.', badge_category: cloud_computing, issued_by: 'Microsoft' },
  { name: 'Cloudera Certified Professional Data Engineer', description: 'Big data engineering certification.', badge_category: software_development, issued_by: 'Cloudera' },
  { name: 'Certified Blockchain Developer', description: 'Blockchain development certification.', badge_category: software_development, issued_by: 'Blockchain Council' }
])

# Users
user1 = User.create(name: 'Barış Arslan', email: 'barıs.arslan@gmail.com', password: 'password')
user2 = User.create(name: 'Ahmet Bulut', email: 'ahmet.bulut@gmail.com', password: 'password')
user3 = User.create(name: 'Doğan Gümüş', email: 'dogan.ggumus@gmail.com', password: '123456')
user4 = User.create(name: 'Ali Demir', email: 'ali.demir@gmail.com', password: '123456')
user5 = User.create(name: 'Ayşe Yılmaz', email: 'ayse.yilmaz@gmail.com', password: '123456')
user6 = User.create(name: 'Mehmet Çelik', email: 'mehmet.celik@gmail.com', password: '123456')
user7 = User.create(name: 'Zeynep Kaya', email: 'zeynep.kaya@gmail.com', password: '123456')
user8 = User.create(name: 'Emre Şahin', email: 'emre.sahin@gmail.com', password: '123456')
user9 = User.create(name: 'Fatma Arslan', email: 'fatma.arslan@gmail.com', password: '123456')
user10 = User.create(name: 'Ahmet Koç', email: 'ahmet.koc@gmail.com', password: '123456')
AdminUser.create!(email: 'dogan.ggumus@gmail.com', password: 'password', password_confirmation: 'password')

# Assign Roles
user1.roles << Role.find_by(name: 'teacher')
user2.roles << Role.find_by(name: 'teacher')
user3.roles << Role.find_by(name: 'student')
user4.roles << Role.find_by(name: 'student')
user5.roles << Role.find_by(name: 'student')
user6.roles << Role.find_by(name: 'student')
user7.roles << Role.find_by(name: 'student')
user8.roles << Role.find_by(name: 'student')
user9.roles << Role.find_by(name: 'student')
user10.roles << Role.find_by(name: 'student')



# Skill oluşturma
skill1 = Skill.find_or_create_by(name: 'Cybersecurity')
skill2 = Skill.find_or_create_by(name: 'Networking')
skill3 = Skill.find_or_create_by(name: 'Cloud Computing')
skill4 = Skill.find_or_create_by(name: 'Programming')
skill5 = Skill.find_or_create_by(name: 'Machine Learning')
skill6 = Skill.find_or_create_by(name: 'Artificial Intelligence')
skill7 = Skill.find_or_create_by(name: 'Data Analysis')
skill8 = Skill.find_or_create_by(name: 'Big Data')
skill9 = Skill.find_or_create_by(name: 'Blockchain')
skill10 = Skill.find_or_create_by(name: 'DevOps')
skill11 = Skill.find_or_create_by(name: 'Ethical Hacking')
skill12 = Skill.find_or_create_by(name: 'Software Development')
skill13 = Skill.find_or_create_by(name: 'Web Development')
skill14 = Skill.find_or_create_by(name: 'Mobile App Development')
skill15 = Skill.find_or_create_by(name: 'Game Development')
skill16 = Skill.find_or_create_by(name: 'Embedded Systems')
skill17 = Skill.find_or_create_by(name: 'Systems Administration')
skill18 = Skill.find_or_create_by(name: 'Project Management')
skill19 = Skill.find_or_create_by(name: 'Database Management')
skill20 = Skill.find_or_create_by(name: 'Computer Vision')
skill21 = Skill.find_or_create_by(name: 'Natural Language Processing')
skill22 = Skill.find_or_create_by(name: 'IoT (Internet of Things)')
skill23 = Skill.find_or_create_by(name: 'Virtual Reality')
skill24 = Skill.find_or_create_by(name: 'Augmented Reality')
skill25 = Skill.find_or_create_by(name: 'Quantum Computing')
skill26 = Skill.find_or_create_by(name: 'Operating Systems')
skill27 = Skill.find_or_create_by(name: 'Algorithms')
skill28 = Skill.find_or_create_by(name: 'Computer Architecture')
skill29 = Skill.find_or_create_by(name: 'Cryptography')
skill30 = Skill.find_or_create_by(name: 'Human-Computer Interaction')


# Rozetlere beceri ekleme
badge = Badge.find_by(name: 'Certified Kubernetes Administrator (CKA)')
badge.skills << skill1 if badge.present?
badge.skills << skill2 if badge.present?

badge = Badge.find_by(name: 'Oracle Certified Professional (OCP) Java SE Programmer')
badge.skills << skill3 if badge.present?
badge.skills << skill4 if badge.present?

badge = Badge.find_by(name: 'Microsoft Certified: Azure Developer Associate')
badge.skills << skill5 if badge.present?
badge.skills << skill6 if badge.present?

badge = Badge.find_by(name: 'AWS Certified Developer – Associate')
badge.skills << skill7 if badge.present?
badge.skills << skill8 if badge.present?

badge = Badge.find_by(name: 'Google Professional Cloud Developer')
badge.skills << skill9 if badge.present?
badge.skills << skill10 if badge.present?

badge = Badge.find_by(name: 'Certified ScrumMaster® (CSM)')
badge.skills << skill11 if badge.present?
badge.skills << skill12 if badge.present?

badge = Badge.find_by(name: 'Professional Scrum Developer I (PSD I)')
badge.skills << skill13 if badge.present?
badge.skills << skill14 if badge.present?

badge = Badge.find_by(name: 'Certified Secure Software Lifecycle Professional (CSSLP)')
badge.skills << skill15 if badge.present?
badge.skills << skill16 if badge.present?

badge = Badge.find_by(name: 'Red Hat Certified Engineer (RHCE)')
badge.skills << skill17 if badge.present?
badge.skills << skill18 if badge.present?

badge = Badge.find_by(name: 'Certified Software Development Professional (CSDP)')
badge.skills << skill19 if badge.present?
badge.skills << skill20 if badge.present?

badge = Badge.find_by(name: 'Microsoft Certified Solutions Developer (MCSD)')
badge.skills << skill21 if badge.present?
badge.skills << skill22 if badge.present?

badge = Badge.find_by(name: 'AWS Certified Solutions Architect – Associate')
badge.skills << skill23 if badge.present?
badge.skills << skill24 if badge.present?

badge = Badge.find_by(name: 'Google Associate Android Developer')
badge.skills << skill25 if badge.present?
badge.skills << skill26 if badge.present?

badge = Badge.find_by(name: 'Cisco Certified Network Associate (CCNA)')
badge.skills << skill27 if badge.present?
badge.skills << skill28 if badge.present?

badge = Badge.find_by(name: 'CompTIA Security+')
badge.skills << skill29 if badge.present?
badge.skills << skill1 if badge.present?

badge = Badge.find_by(name: 'Certified Ethical Hacker (CEH)')
badge.skills << skill2 if badge.present?
badge.skills << skill3 if badge.present?

badge = Badge.find_by(name: 'Certified Information Systems Security Professional (CISSP)')
badge.skills << skill4 if badge.present?
badge.skills << skill5 if badge.present?

badge = Badge.find_by(name: 'Google Certified Professional Data Engineer')
badge.skills << skill6 if badge.present?
badge.skills << skill7 if badge.present?

badge = Badge.find_by(name: 'PMP: Project Management Professional')
badge.skills << skill8 if badge.present?
badge.skills << skill9 if badge.present?

badge = Badge.find_by(name: 'Certified Data Professional (CDP)')
badge.skills << skill10 if badge.present?
badge.skills << skill11 if badge.present?

badge = Badge.find_by(name: 'Docker Certified Associate (DCA)')
badge.skills << skill12 if badge.present?
badge.skills << skill13 if badge.present?

badge = Badge.find_by(name: 'Certified JavaScript Developer')
badge.skills << skill14 if badge.present?
badge.skills << skill15 if badge.present?

badge = Badge.find_by(name: 'Unity Certified Developer')
badge.skills << skill16 if badge.present?
badge.skills << skill17 if badge.present?

badge = Badge.find_by(name: 'Certified PHP Engineer')
badge.skills << skill18 if badge.present?
badge.skills << skill19 if badge.present?

badge = Badge.find_by(name: 'Certified Python Developer')
badge.skills << skill20 if badge.present?
badge.skills << skill21 if badge.present?

badge = Badge.find_by(name: 'Microsoft Certified: Power Platform Developer Associate')
badge.skills << skill22 if badge.present?
badge.skills << skill23 if badge.present?

badge = Badge.find_by(name: 'AWS Certified Machine Learning – Specialty')
badge.skills << skill24 if badge.present?
badge.skills << skill25 if badge.present?

badge = Badge.find_by(name: 'Microsoft Certified: Azure AI Engineer Associate')
badge.skills << skill26 if badge.present?
badge.skills << skill27 if badge.present?

badge = Badge.find_by(name: 'Cloudera Certified Professional Data Engineer')
badge.skills << skill28 if badge.present?
badge.skills << skill29 if badge.present?

badge = Badge.find_by(name: 'Certified Blockchain Developer')
badge.skills << skill1 if badge.present?
badge.skills << skill2 if badge.present?


Badge.update_all(image_url: "https://webandcrafts.com/_next/image?url=https%3A%2F%2Fadmin.wac.co%2Fuploads%2FCyber_security_Benefits_and_Disadvantages_1_9912be4b1e.jpg&w=4500&q=90")



# Eğer her bir badge için farklı görsel istiyor isem burayı kullanacağım.
# Badge.find_by(name: 'Certified Kubernetes Administrator (CKA)').update(image_url: "https://example.com/image1.jpg")
# Badge.find_by(name: 'AWS Certified Developer – Associate').update(image_url: "https://example.com/image2.jpg")

