# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Seeding admins..."

# Create sample admins
10.times do |i|
  Admin.create!(
    username: "admin#{i+1}",
    email: "admin#{i+1}@example.com",
    firstName: "Admin #{i+1}",
    password: "S3cur3P@ss!"
  )
end

puts "Seeding Categories..."
categories = [
  { abbv: 'FOOD', cat_name: 'Food' },
  { abbv: 'HSG', cat_name: 'Housing' },
  { abbv: 'HLTH', cat_name: 'Healthcare' },
  { abbv: 'EDU', cat_name: 'Education' },
  { abbv: 'CHLD', cat_name: 'Childcare' },
  { abbv: 'LEGL', cat_name: 'Legal Resources' }
]

categories.each do |category|
  Category.find_or_create_by!(abbv: category[:abbv]) do |cat|
    cat.cat_name = category[:cat_name]
  end
end

puts "Seeding organizations..."

# Create sample organizations
Organization.find_or_create_by!(email: "info@agapelife.org") do |org|
  org.org_name = "Agape Life Church: Food Assistance"
  org.street = "5970 W 60th Ave"
  org.city = "Arvada"
  org.org_state = "CO"
  org.zipcode = 80003
  org.phoneNumber = "303-431-6481"
  org.webLink = "https://agapelife.org/"
  org.servicesSummary = "Provides a food pantry and hosts a monthly TEFAP (The Emergency Food Assistance Program) food distribution site."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@CoTable.org") do |org|
  org.org_name = "Community Table: Emergency Food"
  org.street = "8555 W 57th Ave"
  org.city = "Arvada"
  org.org_state = "CO"
  org.zipcode = 80002
  org.phoneNumber = "303-424-6685"
  org.webLink = "https://cotable.org/"
  org.servicesSummary = "Provides emergency food to individuals and families. Each client selects a supply of food based on household size. Families and individuals may use this program when needed."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "westyoffice@gmail.com") do |org|
  org.org_name = "Westminster Presbyterian Church: Food Pantry"
  org.street = "3990 W 79th Ave"
  org.city = "Westminster"
  org.org_state = "CO"
  org.zipcode = 80030
  org.phoneNumber = "303-429-8508"
  org.webLink = "https://westypres.org/fish-food-pantry/"
  org.servicesSummary = "Offers a food pantry that provides a prepacked box of non-perishable items. Clients can receive a food box once a month. Provides enough food for four days."  
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "assistance@growinghome.org") do |org|
  org.org_name = "Growing Home: Food Pantry"
  org.street = "3489 W 79th Ave, #112"
  org.city = "Westminster"
  org.org_state = "CO"
  org.zipcode = 80030
  org.phoneNumber = "303-426-0560"
  org.webLink = "https://growinghome.org/food-pantry-updates/"
  org.servicesSummary = "Provides food for individuals and families twice a month."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "gethelp@theactioncenter.org") do |org|
  org.org_name = "Action Center: Food Pantry"
  org.street = "8745 W 14th Ave"
  org.city = "Lakewood"
  org.org_state = "CO"
  org.zipcode = 80215
  org.phoneNumber = "303-237-7704"
  org.webLink = "http://theactioncenter.org/"
  org.servicesSummary = "Offers a community food pantry that individuals can utilize once a month."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "jesses@summithousing.us") do |org|
  org.org_name = "Summit Combined Housing Authority:Pre-Purchase Housing Classes and Counseling"
  org.street = "331 West Main Street, Suite 100"
  org.city = "Frisco "
  org.org_state = "CO"
  org.zipcode = 80443
  org.phoneNumber = "970-668-4178"
  org.webLink = "https://www.summithousing.us/"
  org.servicesSummary = "Offers down payment assistance through low-interest loans for primary residences in Summit County"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@peaceworksinc.co") do |org|
  org.org_name = "Peace Works:Domestic Violence/Sexual Assault Safe House and Crisis Line"  
  org.street = "25997 Conifer Rd"
  org.city = "Conifer"
  org.org_state = "CO"
  org.zipcode = 80433
  org.phoneNumber = "303-838-8181"
  org.webLink = "https://peaceworksinc.co/services/"
  org.servicesSummary = "Provides female survivors of domestic violence/sexual assault and their children with:Emergency shelter, Food, Case management, Counseling, Support."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "INFO@CCDENVER.ORG") do |org|
  org.org_name = "Archdiocesan Housing Committee:Subsidized Housing"
  org.street = "17414 W 10th Ave"
  org.city = "Golden"
  org.org_state = "CO"
  org.zipcode = 80401
  org.phoneNumber = "303-830-0215"
  org.webLink = "https://ccdenver.org/housing/"
  org.servicesSummary = "Provides one-bedroom units for seniors and individuals with physical disabilities."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@mwhsolutions.org") do |org|
  org.org_name = "Metro West Housing Solutions:Affordable Housing"
  org.street = "5800 W Alameda Ave"
  org.city = "Lakewood"
  org.org_state = "CO"
  org.zipcode = 80226
  org.phoneNumber = "303-987-7580"
  org.webLink = "https://www.mwhs.org/communities/"
  org.servicesSummary = "Offers affordable studio,1, 2 and 3-bedroom apartment homes. Housing Choice Vouchers (Section 8) are accepted"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "contact@copovertylawproject.org") do |org|
  org.org_name = "Housing Legal Advice for Young Adults"
  org.street = "520 W Colfax Ave"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80204
  org.phoneNumber = "303-532-2641"
  org.webLink = "https://www.copovertylawproject.org/"
  org.servicesSummary = "Connects individuals with pro bono volunteer attorneys in need of housing or general legal services and advice."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@tepeyachealth.org") do |org|
  org.org_name = "Tepeyac Community Health Center"
  org.street = "2101 E 48th Ave"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80216
  org.phoneNumber = " 303-458-5302"
  org.webLink = "https://www.tepeyachealth.org/"
  org.servicesSummary = "Providea primary care, dental, behavioral health, maternal and women’s health, pediatrics and a variety of health promotion."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "coverageassist@healthdistrict.org") do |org|        
  org.org_name = "Health District of Northern Larimer County: Health Insurance Information" 
  org.street = "144 N Mason St, Ste 7"
  org.city = "Fort Collins"
  org.org_state = "CO"
  org.zipcode = 80524
  org.phoneNumber = "970-530-0120"
  org.webLink = "http://larimerhealthconnect.org/"
  org.servicesSummary = "Helps people find the best options for health insurance to meet their health needs and budget. Provides assistance in understanding options offered through Connect for Health Colorado and can assist with determining eligibility for Health First Colorado (Medicaid) and CHP+ and Medicare. May be able to help people find free or low-cost prescription medications."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "healthaccess@htop.org") do |org|
  org.org_name = "Hilltop Community Resources: Health Insurance Information and Counseling"
  org.street = "1129 Colorado Ave"
  org.city = "Grand Junction"
  org.org_state = "CO"
  org.zipcode = 81501
  org.phoneNumber = "970-244-0850"
  org.webLink = "http://hilltopshealthaccess.org/"
  org.servicesSummary = "Provides unbiased information and in-person assistance for the Marketplace and other health plan options. Health Access is a certified assistance site for Connect for Health Colorado."
  org.avgStarValue = "admin"
  org.admin_username = ""
end

Organization.find_or_create_by!(email: "info@doctorscare.org") do |org|
  org.org_name = "Doctors Care: Medicaid/Medicare Application Assistance"
  org.street = "609 W Littleton Blvd, Ste 100"
  org.city = "Littleton"
  org.org_state = "CO"
  org.zipcode = 80120
  org.phoneNumber = "720-458-6185"
  org.webLink = "http://doctorscare.org/"
  org.servicesSummary = "Assists individuals with the application process for Medicaid and subsidized insurance plans through the Connect for Health Colorado online marketplace. Health coverage guides help patients apply for Medicaid, tax-credits for private plans, and other financial assistance programs. Serves as a Connect for Health Colorado Assistance Site and a Certified Medicaid Application Assistance Site."
  org.avgStarValue = "admin"
  org.admin_username = ""
end

Organization.find_or_create_by!(email: "nchacarecoordination.alliance@nocoha.org") do |org| 
  org.org_name = "North Colorado Health Alliance: Health Insurance Enrollment Assistance"   
  org.street = "2930 11th Ave"
  org.city = "Evans"
  org.org_state = "CO"
  org.zipcode = 80620
  org.phoneNumber = "970-350-4673"
  org.webLink = "http://northcoloradohealthalliance.org/"
  org.servicesSummary = "Provides assistance to individuals seeking health coverage through the Connect for Health Colorado website. Offers on-site assistance from trained professionals throughout the process of searching for and purchasing the best health insurance for each individual online."
  org.avgStarValue = "admin"
  org.admin_username = ""
end

Organization.find_or_create_by!(email: "general@morganfamilycenter.org") do |org|
  org.org_name = "Morgan County Family Center: General Assistance"
  org.street = "411 Main St, Ste 100"
  org.city = "Fort Morgan"
  org.org_state = "CO"
  org.zipcode = 80701
  org.phoneNumber = "970-867-9606"
  org.webLink = "http://morganfamilycenter.org/how-we-serve/family-support-programs/emergency-financial-assistance/"
  org.servicesSummary = "Provides general assistance, including: parenting information and referrals and certified application assistance (Medicaid, CHP+ enrollment)."
  org.avgStarValue = "admin"
  org.admin_username = ""
end

Organization.find_or_create_by!(email: "adulted@springinstitute.org") do |org|
  org.org_name = "Spring Institute for Intercultural Learning"
  org.street = "1373 Grant St"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80203
  org.phoneNumber = "303-863-0188"
  org.webLink = "http://springinstitute.org/adult-education"
  org.servicesSummary = "Provides classes focused on community English Language Acquisition (ELA) and career coaching services for internationally trained professionals with backgrounds in healthcare and education industries."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "centro@archden.org") do |org|
  org.org_name = "Centro San Juan Diego: Adult Education"
  org.street = "2830 Lawrence St"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80205
  org.phoneNumber = "303-295-9470"
  org.webLink = "http://centrosanjuandiego.org/en/higher-education/"
  org.servicesSummary = "Provides the following adult education classes in Spanish: english as a Second Language Basic, intermediate computer classes, GED preparation, US citizenship, tax preparer certification and bachelor & Master degree programs with the Universidad Popular Autonoma del Estado de Puebla (UPAEP)."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "OlderAdultServices@bouldercolorado.gov") do |org|   
  org.org_name = "Boulder Older Adult Services"
  org.street = "909 Arapahoe Ave"
  org.city = "Boulder"
  org.org_state = "CO"
  org.zipcode = 80302
  org.phoneNumber = "303-441-3148"
  org.webLink = "http://boulderolderadultservices.com/"
  org.servicesSummary = "Programs and classes include: health and wellness, health and supportive services, lifelong learning, technology support and education, social programs, volunteer-led special interest groups, and congregate lunch service. Adults aged 60 or older."    
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@parentschallenge.org") do |org|
  org.org_name = "Parents Challenge: Scholarships"
  org.street = "2 N Cascade Ave, Ste 1280"
  org.city = "Colorado Springs"
  org.org_state = "CO"
  org.zipcode = 80903
  org.phoneNumber = "719-306-8557"
  org.webLink = "http://parentschallenge.org/"
  org.servicesSummary = "Provides scholarships to low-income families with a child who is attending, or wants to attend a: private school, public (traditional) school, public (charter) school or home- schooling program."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@peakparent.org") do |org|
  org.org_name = "Peak Parent Center: Disabled Youth Transition to College Services"
  org.street = "917 E Moreno Ave, Ste 140"
  org.city = "Colorado Springs"
  org.org_state = "CO"
  org.zipcode = 80903
  org.phoneNumber = "719-531-9400"
  org.webLink = "http://peakparent.org/"
  org.servicesSummary = "Provides resources, training, and support to families and to youth with disabilities. Assists with: transition to college, post-secondary opportunities, how to plan for positive futures and how to access supports and services after leaving school."   
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "carolyn.sackariason@aspen.gov") do |org|
  org.org_name = "kids first:Childcare Resource Center"
  org.street = "215 N Garmisch Street"
  org.city = "Aspen"
  org.org_state = "CO"
  org.zipcode = 81611
  org.phoneNumber = "970-920-5363"
  org.webLink = "aspen.gov/235/Kids-First"
  org.servicesSummary = "Offers an early childhood resource center that supports quality, affordable childcare choices in Aspen."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "program@earlychildhoodoptions.org") do |org|        
  org.org_name = "early childhood options"
  org.street = "330 Fiedler Ave, Ste 208"
  org.city = "Dillion "
  org.org_state = "CO"
  org.zipcode = 80435
  org.phoneNumber = "970-4063076"
  org.webLink = "https://www.earlychildhoodoptions.org/"
  org.servicesSummary = "Early Childhood Options in Summit County offers resources for families and educators, including childcare, mental health services, and professional development in early childhood education."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "dovesnest96@gmail.com") do |org|
  org.org_name = "Doves Nest: Early Childcare and Education Center"
  org.street = "418 Pine St"
  org.city = "Dove Creek "
  org.org_state = "CO"
  org.zipcode = 81324
  org.phoneNumber = "970-677-2850"
  org.webLink = "N/A"
  org.servicesSummary = "Dove Nest's Services include: - Infant Care ( 2 months +) - Early childhood education/preschool - After school childcare - Summer/Holiday childcare -Curriculum"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "cmiller@familydevelopmentcenter.org") do |org|      
  org.org_name = "United Way of Weld County"
  org.street = "814 9th St"
  org.city = "Greeley"
  org.org_state = "CO"
  org.zipcode = 80631
  org.phoneNumber = "970-879-7330"
  org.webLink = "familydevelopmentcenter.org"
  org.servicesSummary = "Supports families with finding child care options and offers resources for child care providers."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "mcpcf@mesacounty.us") do |org|
  org.org_name = "Mesa County Partnership for Children and Families"
  org.street = "3270 D 1/2 Rd"
  org.city = "Clifton"
  org.org_state = "CO"
  org.zipcode = 81520
  org.phoneNumber = "970-563-3211"
  org.webLink = "https://childcare.mesacountypcf.org/welcome"
  org.servicesSummary = "Provides information on provider openings for: Full-time and part-time careBefore school care, after school careSummer care/camps"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "admin@mybrightfuture.org") do |org|
  org.org_name = "Bright Future Foundation: Domestic Violence / Sexual Assault Legal Advocacy"
  org.street = "1060 W Beaver Creek Blvd Ste 201"
  org.city = "Avon"
  org.org_state = "CO"
  org.zipcode = 81620
  org.phoneNumber = "970-949-7097"
  org.webLink = "https://mybrightfuture.org/advocacy/"
  org.servicesSummary = "Legal Advocacy to all impacted by domestic violence and sexual assault"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "02juvenileselfhelp@judicial.state.co.us") do |org|  
  org.org_name = "Second Judicial District: Juvenile Court Self-Help Center"
  org.street = "520 W Colfax Ave Rm 125"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80202
  org.phoneNumber = "303-606-2849"
  org.webLink = "https://www.coloradojudicial.gov/"
  org.servicesSummary = "Offers assistance with filing actions related to juvenile cases, such as: Adoption, Child custody, Expungement, Child support, Modification of parenting issues , Modification of child support, Grandparent custody / Grandparent visitation"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "info@alpinelegalservices.com") do |org|
  org.org_name = "Alpine Legal Services: Legal Counseling"
  org.street = "110 8th St"
  org.city = "Glenwood Springs"
  org.org_state = "CO"
  org.zipcode = 81601
  org.phoneNumber = "970-945-8858"
  org.webLink = "https://alpinelegalservices.org/"
  org.servicesSummary = "Depending on the specifics of the case, Alpine Legal Services may be able to help. Provides the following programs and legal services to people who live or work between Aspen and Parachute: Family law, Housing law, Elder law,Immigration"
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "vtaylor.wcls@gmail.com") do |org|
  org.org_name = "Weld County Legal Services:Legal Advice Night"
  org.street = "915 10th St"
  org.city = "Greeley"
  org.org_state = "CO"
  org.zipcode = 80631
  org.phoneNumber = "970-310-8367"
  org.webLink = "https://weldcountylegalservices.com/"
  org.servicesSummary = "Offers time to sit with a lawyer and get legal advice around a specific issue. Immigration attorneys are available to assist with immigration matters."        
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "bouldercourtselfhelp@judicial.state.co.us") do |org|
  org.org_name = "Boulder County Combined Court: Free Legal Resources"
  org.street = "1035 Kimbark St"
  org.city = "Longmont"
  org.org_state = "CO"
  org.zipcode = 80501
  org.phoneNumber = "303-441-3750"
  org.webLink = "N/A"
  org.servicesSummary = "Offers a variety of classes and legal resources."
  org.avgStarValue = ""
  org.admin_username = "admin"
end

Organization.find_or_create_by!(email: "org1@example.com") do |org|
  org.org_name = "Organization 1"
  org.street = "1234 Main St"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80202
  org.phoneNumber = "123-456-7890"
  org.webLink = "https://organization1.com"
  org.servicesSummary = "We provide essential community services."
  org.avgStarValue = 4.5
  org.admin_username = "admin"
end

puts "Seeding classification"
# Organization-category mapping
organization_categories = [
  { email: "info@agapelife.org", category_abbr: ["FOOD"] },
  { email: "info@cotable.org", category_abbr: ["FOOD"] },
  { email: "westyoffice@gmail.com", category_abbr: ["FOOD"] },
  { email: "assistance@growinghome.org", category_abbr: ["FOOD"] },
  { email: "gethelp@theactioncenter.org", category_abbr: ["FOOD"] },
  { email: "jesses@summithousing.us", category_abbr: ["HSG"] },
  { email: "info@peaceworksinc.co", category_abbr: ["HSG"] },
  { email: "info@ccdenver.org", category_abbr: ["HSG"] },
  { email: "info@mwhsolutions.org", category_abbr: ["HSG"] },
  { email: "contact@copovertylawproject.org", category_abbr: ["HSG"] },
  { email: "info@tepeyachealth.org", category_abbr: ["HLTH"] },
  { email: "coverageassist@healthdistrict.org", category_abbr: ["HLTH"] },
  { email: "healthaccess@htop.org", category_abbr: ["HLTH"] },
  { email: "info@doctorscare.org", category_abbr: ["HLTH"] },
  { email: "nchacarecoordination.alliance@nocoha.org", category_abbr: ["HLTH"] },
  { email: "general@morganfamilycenter.org", category_abbr: ["HLTH"] },
  { email: "adulted@springinstitute.org", category_abbr: ["EDU"] },
  { email: "centro@archden.org", category_abbr: ["EDU"] },
  { email: "olderadultservices@bouldercolorado.gov", category_abbr: ["EDU"] },
  { email: "info@parentschallenge.org", category_abbr: ["EDU"] },
  { email: "info@peakparent.org", category_abbr: ["EDU"] },
  { email: "carolyn.sackariason@aspen.gov", category_abbr: ["CHLD"] },
  { email: "program@earlychildhoodoptions.org", category_abbr: ["CHLD"] },
  { email: "dovesnest96@gmail.com", category_abbr: ["CHLD"] },
  { email: "cmiller@familydevelopmentcenter.org", category_abbr: ["CHLD"] },
  { email: "mcpcf@mesacounty.us", category_abbr: ["CHLD"] },
  { email: "admin@mybrightfuture.org", category_abbr: ["LEGL"] },
  { email: "02juvenileselfhelp@judicial.state.co.us", category_abbr: ["LEGL"] },
  { email: "info@alpinelegalservices.com", category_abbr: ["LEGL"] },
  { email: "vtaylor.wcls@gmail.com", category_abbr: ["LEGL"] },
  { email: "bouldercourtselfhelp@judicial.state.co.us", category_abbr: ["LEGL"] },
  { email: "org1@example.com", category_abbr: ["FOOD", "LEGL", "EDU", "HLTH", "HSG", "CHLD"] }
]

organization_categories.each do |mapping|
  organization = Organization.find_by(email: mapping[:email])
  
  if organization && mapping[:category_abbr]
    mapping[:category_abbr].each do |abbr|  # Iterate over each category abbreviation
      category = Category.find_by(abbv: abbr)
      if category
        Classification.find_or_create_by!(organizationID_id: organization.organizationId, categoryabbr_id: category.abbv)
      else
        puts "Category not found for abbreviation: #{abbr}"
      end
    end
  else
    puts "Organization not found for email: #{mapping[:email]}" if organization.nil?
    puts "No category found for email: #{mapping[:email]}" if mapping[:category_abbr].nil?
  end
end

puts "Seeding users..."

# Create sample users with valid age ranges
# Create 10 Users
10.times do |i|
  User.create!(
    username: "user#{i+1}",
    email: "user#{i+1}@example.com",
    first_name: "User #{i+1}",
    age_range: ["18-25", "26-35", "36-45", "46-60", "60+"].sample,
    password: ("QwErTy9$"),
    zipcode: "800#{i+1}0"
  )
end

puts "Seeding events..."

# # Create sample events
# Event.find_or_create_by!(title: "Community Food Drive", eventDate: Date.today + 3) do |event|
#   event.eventTime = "09:00"
#   event.eventDescription = "Join us for a community food drive to support local food banks."
#   event.street = "1234 Main St"
#   event.city = "Denver"
#   event.eventState = "CO"
#   event.zipcode = 80202
#   event.isVirtual = false
#   event.meetingLink = nil
#   event.eventstatus = true
#   #event.organization_id = "org1@example.com"
#   event.user_id = "user1"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Virtual Job Fair", eventDate: Date.today + 7) do |event|
#   event.eventTime = "14:00"
#   event.eventDescription = "A virtual job fair connecting local businesses with job seekers."
#   event.street = "Virtual"
#   event.city = "Denver"
#   event.eventState = "CO"
#   event.zipcode = 80203
#   event.isVirtual = true
#   event.meetingLink = "https://zoom.us"
#   event.eventstatus = true
#   #event.organizationId = "org2@example.com"
#   event.user_id = "user2"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Virtual Tech Meetup", eventDate: Date.today + 5) do |event|
#   event.eventTime = "14:00"
#   event.eventDescription = "A virtual meetup for tech enthusiasts to network and discuss the latest trends."
#   event.street = "1234 Security Drive"
#   event.city = "Aurora"
#   event.eventState = "CO"
#   event.zipcode = 80014
#   event.isVirtual = true
#   event.meetingLink = "http://example.com/meetup"
#   event.eventstatus = true
#   #event.organizationId = "org2@example.com"
#   event.user_id = "user2"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Neighborhood Cleanup", eventDate: Date.today + 10) do |event|
#   event.eventTime = "08:00"
#   event.eventDescription = "Help clean up our neighborhood park and surrounding areas."
#   event.street = "5678 Park Ave"
#   event.city = "Aurora"
#   event.eventState = "CO"
#   event.zipcode = 80012
#   event.isVirtual = false
#   event.meetingLink = nil
#   event.eventstatus = true
#   #event.organizationId = "org3@example.com"
#   event.user_id = "user3"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Coding Bootcamp", eventDate: Date.today + 14) do |event|
#   event.eventTime = "10:00"
#   event.eventDescription = "A free coding bootcamp for beginners looking to learn programming."
#   event.street = "3456 Elm St"
#   event.city = "Boulder"
#   event.eventState = "CO"
#   event.zipcode = 80301
#   event.isVirtual = false
#   event.meetingLink = nil
#   event.eventstatus = true
#   #event.organizationId = "org4@example.com"
#   event.user_id = "user4"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Mental Health Awareness Webinar", eventDate: Date.today + 7) do |event|
#   event.eventTime = "12:00"
#   event.eventDescription = "A webinar on mental health awareness and resources available in the community."
#   event.street = "3245 Perspective Ave."
#   event.city = "Denver"
#   event.eventState = "CO"
#   event.zipcode = 80231
#   event.isVirtual = true
#   event.meetingLink = "http://example.com/webinar"
#   event.eventstatus = true
#   #event.organizationId = "org5@example.com"
#   event.user_id = "user5"
#   event.admin_id = "admin"
# end

# Event.find_or_create_by!(title: "Back-to-School Supply Drive", eventDate: Date.today + 20) do |event|
#   event.eventTime = "11:00"
#   event.eventDescription = "Donate school supplies to help kids in need prepare for the new school year."
#   event.street = "910 Willow St"
#   event.city = "Fort Collins"
#   event.eventState = "CO"
#   event.zipcode = 80524
#   event.isVirtual = false
#   event.meetingLink = nil
#   event.eventstatus = true
#   #event.organizationId = "org6@example.com"
#   event.user_id = "user6"
#   event.admin_id = "admin"
# end
Event.find_or_create_by!(title: "Denver Feed A Family ", eventDate: "2024-11-23") do |event|
  event.eventTime = "06:00"
  event.eventDescription = "Denver Feed-A-Family, inspired by the legacy of Daddy Bruce, is a community-wide Thanksgiving distribution honoring his tradition of giving. Since 1963, Daddy Bruce has been remembered for feeding people each Thanksgiving. This year, The Epworth Foundation is committed to distributing 7,500 baskets, each filled with all the Thanksgiving trimmings and a turkey, enough to feed a family of eight"
  event.street = "Bruce Randolph Avenue and High Street"
  event.city = "Denver"
  event.eventState = "CO"
  event.zipcode = 80205
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Denver Christkindlmarket", eventDate: "2024-11-25") do |event|
  event.eventTime = "11:00"
  event.eventDescription = "The Denver Christkindlmarket is the city’s only authentic European holiday market, offering a festive pop-up experience inspired by traditional European village markets. Guests can shop for finely crafted artisan gifts and holiday treats from local, European, and international vendors in cozy wooden huts. Stroll through this holiday village while enjoying authentic Glühwein (mulled spiced wine), Bavarian-style beers, European coffee, hot chocolate, and liqueurs. Savor delicious family recipes from across Europe, including Bavarian-style pretzels, smoked salmon, Knödel, Goulasch, Nürnberger sausages, as well as handmade pastries, caramels, and European chocolates."
  event.street = "101 14th Ave"
  event.city = "Denver"
  event.eventState = "CO"
  event.zipcode = 80204
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Vegan Friendsgiving Plant-Based Potluck", eventDate: "2024-11-26") do |event|
  event.eventTime = "12:00"
  event.eventDescription = ""
  event.street = "2259 Broadway "
  event.city = "Grand Junction "
  event.eventState = "CO"
  event.zipcode = 0
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Mile High United Way Turkey Trot", eventDate: "2024-11-28") do |event|
  event.eventTime = "9:00"
  event.eventDescription = "Your registration for the 51st Annual Mile High United Way Turkey Trot directly supports families in Metro Denver. Proceeds help provide high-quality early learning so children start school ready to succeed, connect young adults with education and job opportunities, and ensure families can meet their basic needs."
  event.street = "Washington Park"
  event.city = "Denver "
  event.eventState = "CO"
  event.zipcode = 80209
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Ugly Sweater 5K", eventDate: "2024-12-15") do |event|      
  event.eventTime = "09:00"
  event.eventDescription = "Run or walk 5k to raise funds for the Colorado Coalition for the Homeless."
  event.street = "Washington Park, 1000 S Franklin St"
  event.city = "Denver "
  event.eventState = "CO"
  event.zipcode = 80209
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Fundraiser course for L.O.L.A's", eventDate: "2024-12-01") do |event|
  event.eventTime = "10:00"
  event.eventDescription = "This is a fundraiser course for L.O.L.A.'s Rescue, a Colorado-based nonprofit animal rescue organization serving Colorado and surrounding states. Founded with a mission to save as many at-risk animals as possible, L.O.L.A.'s Rescue is dedicated to the care and rehabilitation of animals from high-kill shelters and those facing abuse, neglect, or abandonment. By focusing on reducing euthanasia due to overcrowding, we work to provide these animals with safe, loving homes. We're proud to donate $25 per student back to L.O.L.A.'s to support their lifesaving work."
  event.street = "11001 e Alameda Ave"
  event.city = "Aurora "
  event.eventState = "CO"
  event.zipcode = 80012
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Noel Night ", eventDate: "2024-12-04") do |event|
  event.eventTime = "17:30"
  event.eventDescription = "Noel Night kicks off the holiday season with the lighting of the ceremonial Ski Tree and festive shopping at local retailers. Participating stores will offer special holiday discounts, with many available throughout the day.Stay tuned for more details about the 2024 Noel Night!"
  event.street = "DownTown Telluride "
  event.city = "Telluride "
  event.eventState = "CO"
  event.zipcode = 81435
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Food Pantry Patrons ", eventDate: "2024-12-05") do |event| 
  event.eventTime = "13:00"
  event.eventDescription = "The New Life Community Church Food Pantry in Aurora provides essential groceries and support to community members in need. Open every Tuesday from 1:00 PM to 4:00 PM, the pantry offers a variety of food items for families and individuals. Patrons are asked to bring a photo ID, proof of residence, and verification of household members. Donations of food and clothing are welcomed Monday through Thursday during office hours, with volunteer opportunities available"
  event.street = "7690 E. Iliff Ave"
  event.city = "Aurora "
  event.eventState = "CO"
  event.zipcode = 7690
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "2 Year Olds", eventDate: "2024-12-05") do |event|
  event.eventTime = "09:30"
  event.eventDescription = "The 2-Year-Olds Gymnastics Class in Boulder, CO, introduces young children to gymnastics in a structured environment. Designed for 2-year-olds and 3-year-olds who may have difficulty separating from parents, the class requires each child to be accompanied by a parent or responsible adult. The upcoming session is scheduled for Thursday, December 5, 2024, from 9:30 AM to 10:15 AM at the North Boulder Recreation Center, located at 3170 North Broadway, Boulder, CO 80304."
  event.street = "3170 North Broadway"
  event.city = "Boulder "
  event.eventState = "CO"
  event.zipcode = 80304
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Holiday Food & Gift ", eventDate: "2024-12-06") do |event| 
  event.eventTime = "10:00"
  event.eventDescription = "The 26th Annual Holiday Food & Gift Festival is coming back to Colorado Springs from December 6-8 at the Norris Penrose Event Center. As one of the West’s largest holiday events, this festival offers a fantastic opportunity for early holiday shopping. With over 150 exhibitors, shoppers can find unique, handcrafted gifts, including arts, crafts, woodworking, wearable items, Christmas décor, and a wide variety of gourmet foods. The festival proudly supports small businesses. For vendor details, visit hfgf.com or email info@hfgf.com."
  event.street = "1045 Lower Gold Camp Road"
  event.city = "Colorado Springs "
  event.eventState = "CO"
  event.zipcode = 80905
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "White Christmas ", eventDate: "2024-12-06") do |event|     
  event.eventTime = "19:30"
  event.eventDescription = "White Christmas The Musical returns to Pueblo Memorial Hall this December! Join Musical Community Productions for a holiday favorite featuring a talented local cast. With performances on December 5, 6, and 7, this show is sure to become your new favorite Pueblo holiday tradition. Tickets range from $33 to $43 and include all fees. Visit etix.com to secure your seats."
  event.street = "1 City Hall Place "
  event.city = "Pueblo "
  event.eventState = "CO"
  event.zipcode = 81003
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Boulder Holiday Festival ", eventDate: "2024-12-07") do |event|
  event.eventTime = "16:00"
  event.eventDescription = "The CU Boulder College of Music delights audiences year-round with an impressive array of performances, from orchestras, bands, and choirs to jazz, world music, opera, and special guest appearances. With hundreds of captivating concerts each academic year, there’s something for every music lover in Boulder."
  event.street = "1595 Pleasant Street"
  event.city = "Boulder "
  event.eventState = "CO"
  event.zipcode = 80309
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Talk to Santa ", eventDate: "2024-12-07") do |event|       
  event.eventTime = "09:00"
  event.eventDescription = "Santa is ready to give your child a special call on Saturday, December 7, between 9 a.m. and 12 p.m.! Simply fill out this form to register, and make sure your child is near the phone number you provide at the chosen time. The registration deadline is 5 p.m. on Wednesday, December 4"
  event.street = "N/A "
  event.city = "Broomfield "
  event.eventState = "CO"
  event.zipcode = 80020
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Ullr Fest ", eventDate: "2024-12-12") do |event|
  event.eventTime = "11:00"
  event.eventDescription = "Put on your Viking helmets and get ready to celebrate winter at the 61st annual Ullr Fest, happening December 12-14, 2024! Breckenridge welcomes locals and visitors of all ages to honor Ullr, the Norse god of snow, with hopes for a snow-packed ski season. Join the festivities at the Main Street parade and make history by taking part in the longest ShotskiÂ® â€œunofficialâ€ World Record attempt. If you're up for an epic winter celebration, this is one event you wonâ€™t want to miss!"
  event.street = "Main Street "
  event.city = "Breckenirdge "
  event.eventState = "CO"
  event.zipcode = 80424
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Holiday Crafting - Holiday Trolls", eventDate: "2024-12-12") do |event|
  event.eventTime = "18:00"
  event.eventDescription = "Join us for the Holiday Crafting Series at Cannonball Creek! Taking place at Cannonball Creek Brewing, located at 393 Washington Avenue in Golden, CO, this festive series offers hands-on crafting sessions where all supplies and instruction are included for just $30 per person. Mark your calendar for the following dates and times: Thursday, September 19 from 6-8pm, Sunday, October 20 from 3-5pm, Wednesday, November 20 from 6-8pm, and Thursday, December 12 from 6-8pm. Get ready to get creative and enjoy a bit of holiday cheer with us!"
  event.street = "393 North Washington Avenue"
  event.city = "Golden "
  event.eventState = "CO"
  event.zipcode = 80403
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Holiday Maker's Market & Photos With Santa", eventDate: "2024-12-14") do |event|
  event.eventTime = "13:00"
  event.eventDescription = "Join us for our Holiday Makers Market on Saturday, December 14th! Explore unique creations from local artisans, including handmade jewelry, pottery, fine art, and more.And to make things even more festive, Santa will be here from 3-5pm for photo ops! Photos are on the house with the purchase of any holiday cocktail, single pour, or flight."
  event.street = "5405 W 56th Ave, Unit C"
  event.city = "Arvada "
  event.eventState = "CO"
  event.zipcode = 80002
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Jingle Bell Market Craft Fair ", eventDate: "2024-12-16") do |event|
  event.eventTime = "08:00"
  event.eventDescription = "Join us for the annual Jingle Bell Market Craft Fair at the Broomfield Community Center, located at 280 Spader Way! This festive event showcases eight rooms full of local Colorado crafters, offering unique and handmade gifts perfect for everyone on your holiday list"
  event.street = "280 Spader Way"
  event.city = "Broomfield "
  event.eventState = "CO"
  event.zipcode = 80020
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Free Community Food Markets In Summit County ", eventDate: "2024-12-19") do |event|
  event.eventTime = "11:00"
  event.eventDescription = "FIRC’s Community Food Markets offer fresh, healthy, and nutritious food options, helping families save money, stretch their budgets, and build connections within the community. We invite all residents to visit our Community Food Markets once a week to receive up to $200 worth of groceries.Our markets tackle important issues like food insecurity, food equity, and food waste, while also promoting resource sharing and broader food system improvements in Summit County. Along with free groceries, we provide household items, hygiene products, diapers, and wipes. Plus, we offer assistance with WIC and SNAP applications to help families access even more food resources!"
  event.street = "340 Fiedler Ave"
  event.city = "Dillion "
  event.eventState = "CO"
  event.zipcode = 80435
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Chirstmas Tree Recyling ", eventDate: "2024-12-26") do |event|
  event.eventTime = "07:00"
  event.eventDescription = "Lakewood residents can recycle their holiday trees from 7 a.m. to 3 p.m., Friday, Dec. 26 through Sunday, Jan. 5, 2025. Tree drop-off will be available at Lakewood’s Greenhouse, located at 9556 W. Yale Ave., between Estes and Old Kipling streets. Simply follow the posted signs to the designated drop-off area."
  event.street = "9556 W. Yale Ave"
  event.city = "Lakewood "
  event.eventState = "CO"
  event.zipcode = 80227
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

Event.find_or_create_by!(title: "Monday Mile Challenge ", eventDate: "2025-01-06") do |event|
  event.eventTime = "00:00"
  event.eventDescription = "Kick off your week with a Monday Mile for a chance to win! Start the year on an active note by walking every Monday. Each time you complete and log your mile, you’ll be entered into a prize drawing. Don’t forget to snap a photo along the way!" 
  event.street = "Lakewood "
  event.city = "Lakewood "
  event.eventState = "CO"
  event.zipcode = 80214
  event.isVirtual = false
  event.eventstatus = true
  event.user_id = "user1"
  event.admin_id = "admin"
end

puts "Seeding reviews..."
# Create 10 Reviews
10.times do |i|
  Review.create!(
    organizationID_id: i+1,
    userID_id: "user#{(i % 10) + 1}",
    title: "Review #{i+1}",
    comment: "This is a sample review for organization #{i+1}.",
    starValue: [1.0, 2.0, 3.0, 4.0, 5.0].sample,
    adminID_id: "admin#{(i % 10) + 1}",
    reviewStatus: [true, false].sample
  )
end

puts "Seeding Favorites..."
# Create 10 Favorites
10.times do |i|
  Favorite.create!(
    userID_id: "user#{(i % 10) + 1}",
    organizationID_id: i+1
  )
end
 
puts "Seeding Dependents..."
# Create 10 Dependents
10.times do |i|
  Dependent.create!(
    userID_id: "user#{i+1}",
    nickname: "Dependent #{i+1}",
    ageRange: ["0-18", "18-35", "36-50", "51+"].sample
  )
end

puts "Seeding Questions..."
# Create 10 Questions
10.times do |i|
  Question.create!(
    questionID: i+1,
    admin_username: "admin",
    question: "Questions for survey - Q#{i+1}."
  )
end

puts "Seeding Surveys..."
 
# Create 10 Surveys
10.times do |i|
  Survey.create!(
    userID_id: "user#{i+1}",
    questionID_id: i+1,
    answer: "Answer for survey #{i+1}."
  )
end
 
puts "Seed data created successfully!"