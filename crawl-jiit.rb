require 'mechanize'
require 'debugger'
require 'nokogiri'

HOST = 'https://webkiosk.jiit.ac.in/'

LOGIN_URL = HOST + 'CommonFiles/UserAction.jsp'
ATTENDANCE_URL = HOST + 'StudentFiles/Academic/StudentAttendanceList.jsp'

params = {
	'InstCode' => 'JIIT',
	'UserType' => 'S',
	'MemberCode' => '11503873',	
	'DATE1' => '15-04-1994',
	'Password' => 'ujjw@l15'
}

agent = Mechanize.new
response = agent.post(LOGIN_URL, params)


attendance_response = agent.get(ATTENDANCE_URL)

puts attendance_response.body

#debugger

puts '23'


dom=Nokogiri::HTML(attendance_response.body)
dom.css('td').each {|el| puts el.text}

dom.css('td').each do |el| 
		File.open("11503873.txt", "a") do |file|  
		file.puts el.text
	end
end



