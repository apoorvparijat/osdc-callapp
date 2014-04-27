require 'mechanize'

HOST = 'https://webkiosk.jiit.ac.in/'

LOGIN_URL = HOST + 'CommonFiles/UserAction.jsp'
ATTENDANCE_URL = HOST + 'StudentFiles/Academic/StudentAttendanceList.jsp'

params = {
	'InstCode' => 'JIIT',
	'UserType' => 'S',
	'MemberCode' => '11503878',	
	'DATE1' => '06-11-1994',
	'Password' => 'utkarsh4$'
}

agent = Mechanize.new
response = agent.post(LOGIN_URL, params)


attendance_response = agent.get(ATTENDANCE_URL)

puts attendance_response.body