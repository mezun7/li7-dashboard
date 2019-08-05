require 'json'
require 'net/http'
require 'uri'


timetable = {
1 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	МатК	"},	{value:"	рус	"},	{value:"	геогр	"},	{value:"	Геом	"},	{value:"	инфа	"},	{value:"	рус	"},	{value:"	хим	"},		{value:"	Физ-ра	"},	{value:"	физика	"},	{value:"	ОИст	"},	{value:"	Биол	"},	{value:"	англ	"},	{value:"	лит	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	МатК	"},	{value:"	лит	"},	{value:"	англ	"},	{value:"	Р яз	"},	{value:"	рус	"},	{value:"	геогр	"},	{value:"	ист	"},		{value:"	Физ-ра	"},	{value:"	Биол	"},	{value:"	физика	"},	{value:"	инфа	"},	{value:"	хим	"},	{value:"	лит	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	рус	"},	{value:"	англ	"},	{value:"	Алг	"},	{value:"	тех	"},	{value:"	Р яз	"},	{value:"	хим	"},	{value:"	рус	"},		{value:"	Биол	"},	{value:"	лит	"},	{value:"	мат	"},	{value:"	Физ-ра	"},	{value:"	Биол	"},	{value:"	инфа	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	лит	"},	{value:"	мат	"},	{value:"	Геом	"},	{value:"	тех	"},	{value:"	eng	"},	{value:"	Р яз	"},	{value:"	мат	"},		{value:"	лит	"},	{value:"	инфа	"},	{value:"	ист	"},	{value:"	физика	"},	{value:"	лит	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	тех	"},	{value:"	math	"},	{value:"	Р яз	"},	{value:"	лит	"},	{value:"	ист	"},	{value:"	англ	"},	{value:"	англ	"},		{value:"	рус	"},	{value:"	инфа	"},	{value:"	лит	"},	{value:"	англ	"},	{value:"	тур	"},	{value:"	Биол	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},		{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"},	{value:"	КЧ	"}	] },
	{ cols: [	{value:"	7	"},	{value:"	тех	"},	{value:"	Р яз	"},	{value:"	лит	"},	{value:"	физика	"},	{value:"	Алг	"},	{value:"	тур	"},	{value:"	инфа	"},		{value:"	мат	"},	{value:"	Емат	"},	{value:"	англ	"},	{value:"	Ерус	"},	{value:"	ист	"},	{value:"	Физ-ра	"}	] },
	{ cols: [	{value:"	8	"},	{value:"		"},	{value:"	Оастр	"},	{value:"	tur	"},	{value:"	eng	"},	{value:"	тех	"},	{value:"	Физ-ра	"},	{value:"		"},		{value:"	мат	"},	{value:"	Емат	"},	{value:"	англ	"},	{value:"	Ерус	"},	{value:"		"},	{value:"		"}	] }
],																																													
2 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	англ	"},	{value:"	МатК	"},	{value:"	Геом	"},	{value:"	ист	"},	{value:"	физика	"},	{value:"	Алг	"},	{value:"	Физ-ра	"},		{value:"	лит	"},	{value:"	англ	"},	{value:"	Право	"},	{value:"	физика	"},	{value:"	лит	"},	{value:"	мат	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	ист	"},	{value:"	МатК	"},	{value:"	Алг	"},	{value:"	англ	"},	{value:"	лит	"},	{value:"	math	"},	{value:"	Физ-ра	"},		{value:"	мат	"},	{value:"	общ	"},	{value:"	астр	"},	{value:"	физика	"},	{value:"	лит	"},	{value:"	мат	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	Р лит	"},	{value:"	мат	"},	{value:"	рус	"},	{value:"	eng	"},	{value:"	Физ-ра	"},	{value:"	лит	"},	{value:"	мат	"},		{value:"	мат	"},	{value:"	физика	"},	{value:"	Ерус	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	ист	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	мат	"},	{value:"	ист	"},	{value:"	тех	"},	{value:"	рус	"},	{value:"	Физ-ра	"},	{value:"	физика	"},	{value:"	лит	"},		{value:"	англ	"},	{value:"	Р лит	"},	{value:"	Ерус	"},	{value:"	Емат	"},	{value:"	Емат	"},	{value:"	общ	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	мат	"},	{value:"	Физ-ра	"},	{value:"	инфа	"},	{value:"	тур	"},	{value:"	eng	"},	{value:"	англ	"},	{value:"	Р яз	"},		{value:"	Р яз	"},	{value:"	лит	"},	{value:"	мат	"},	{value:"	Емат	"},	{value:"	Емат	"},	{value:"	физика	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	Физ-ра	"},	{value:"	тех	"},	{value:"	тур	"},	{value:"	Биол	"},	{value:"	Алг	"},	{value:"	ист	"},	{value:"	общ	"},		{value:"	муз	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	лит	"},	{value:"	Р лит	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	7	"},	{value:"	Физ-ра	"},	{value:"	ФизО	"},	{value:"	англ	"},	{value:"	Геом	"},	{value:"	math	"},	{value:"	тех	"},	{value:"	муз	"},		{value:"	общ	"},	{value:"	мат	"},	{value:"	Р лит	"},	{value:"	ист	"},	{value:"	Биол	"},	{value:"	Ерус	"}	] },
	{ cols: [	{value:"	8	"},	{value:"		"},	{value:"	Р лит	"},	{value:"	eng	"},	{value:"	math	"},	{value:"	tur	"},	{value:"		"},	{value:"		"},		{value:"		"},	{value:"		"},	{value:"		"},	{value:"	Ефиз	"},	{value:"	Физ-ра	"},	{value:"	Ерус	"}	] }
],																																													
3 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	англ	"},	{value:"	тех	"},	{value:"	физика	"},	{value:"	Алг	"},	{value:"	тур	"},	{value:"	Алг	"},	{value:"	англ	"},		{value:"	рус	"},	{value:"	мат	"},	{value:"	ист	"},	{value:"	Физ-ра	"},	{value:"	рус	"},	{value:"	хим	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	Р яз	"},	{value:"	ист	"},	{value:"	Алг	"},	{value:"	eng	"},	{value:"	хим	"},	{value:"	Геом	"},	{value:"	тур	"},		{value:"	геогр	"},	{value:"	мат	"},	{value:"	лит	"},	{value:"	Физ-ра	"},	{value:"	англ	"},	{value:"	Еангл	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	рус	"},	{value:"	англ	"},	{value:"	math	"},	{value:"	Р яз	"},	{value:"	Физ-ра	"},	{value:"	рус	"},	{value:"	геогр	"},		{value:"	ист	"},	{value:"	хим	"},	{value:"	Емат	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	Еангл	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	ист	"},	{value:"	рус	"},	{value:"	Физ-ра	"},	{value:"	геогр	"},	{value:"	англ	"},	{value:"	Р яз	"},	{value:"	мат	"},		{value:"	инфа	"},	{value:"	физика	"},	{value:"	Емат	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	рус	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	ист	"},	{value:"	рус	"},	{value:"	рус	"},	{value:"	eng	"},	{value:"	Р яз	"},		{value:"	Р яз	"},	{value:"	физика	"},	{value:"	Право	"},	{value:"	рус	"},	{value:"	хим	"},	{value:"	Емат	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	рус	"},	{value:"	Физ-ра	"},	{value:"	геогр	"},	{value:"	хим	"},	{value:"	рус	"},		{value:"	англ	"},	{value:"	Ерус	"},	{value:"	англ	"},	{value:"	Р лит	"},	{value:"	ист	"},	{value:"	Емат	"}	] },
	{ cols: [	{value:"	7	"},	{value:"	геогр	"},	{value:"	общ	"},	{value:"	Р яз	"},	{value:"	Физ-ра	"},	{value:"	Геом	"},	{value:"	инфа	"},	{value:"	Ерус	"},		{value:"	хим	"},	{value:"	Ерус	"},	{value:"	англ	"},	{value:"	англ	"},	{value:"	физика	"},	{value:"	ист	"}	] },
	{ cols: [	{value:"	8	"},	{value:"		"},	{value:"		"},	{value:"	eng	"},	{value:"	tur	"},	{value:"	Eng	"},	{value:"	геогр	"},	{value:"	Ерус	"},		{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"}	] }
],																																													
4 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	МатК	"},	{value:"	МатК	"},	{value:"	Физ-ра	"},	{value:"	рус	"},	{value:"	Eng	"},	{value:"	Геом	"},	{value:"	физика	"},		{value:"	Ерус	"},	{value:"	рус	"},	{value:"	физика	"},	{value:"	ОБЖ	"},	{value:"	общ	"},	{value:"	Р яз	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	МатК	"},	{value:"	МатК	"},	{value:"	Физ-ра	"},	{value:"	лит	"},	{value:"	геогр	"},	{value:"	math	"},	{value:"	инфа	"},		{value:"	Ерус	"},	{value:"	лит	"},	{value:"	ист	"},	{value:"	общ	"},	{value:"	Р лит	"},	{value:"	ОБЖ	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	Физ-ра	"},	{value:"	мат	"},	{value:"	рус	"},	{value:"	ист	"},	{value:"	tur	"},	{value:"	муз	"},	{value:"	лит	"},		{value:"	мат	"},	{value:"	инфа	"},	{value:"	рус	"},	{value:"	Р лит	"},	{value:"	ОБЖ	"},	{value:"	физика	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	Биол	"},	{value:"	англ	"},	{value:"	лит	"},	{value:"	геогр	"},	{value:"	Eng	"},	{value:"	ист	"},	{value:"	мат	"},		{value:"	мат	"},	{value:"	Р лит	"},	{value:"	лит	"},	{value:"	физика	"},	{value:"	физика	"},	{value:"	Физ-ра	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	лит	"},	{value:"	геогр	"},	{value:"	англ	"},	{value:"	Алг	"},	{value:"	Алг	"},	{value:"	eng	"},	{value:"	Р лит	"},		{value:"	Р лит	"},	{value:"	ист	"},	{value:"	общ	"},	{value:"	лит	"},	{value:"	хим	"},	{value:"	Физ-ра	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	мат	"},	{value:"	рус	"},	{value:"	eng	"},	{value:"	eng	"},	{value:"	лит	"},	{value:"	Биол	"},	{value:"	геогр	"},		{value:"	физика	"},	{value:"	Физ-ра	"},	{value:"	Р лит	"},	{value:"	тур	"},	{value:"	инфа	"},	{value:"	лит	"}	] },
	{ cols: [	{value:"	7	"},	{value:"	мат	"},	{value:"	лит	"},	{value:"	Биол	"},	{value:"	tur	"},	{value:"	Eng	"},	{value:"	лит	"},	{value:"	хим	"},		{value:"	геогр	"},	{value:"	Физ-ра	"},	{value:"	англ	"},	{value:"	инфа	"},	{value:"	лит	"},	{value:"	общ	"}	] },
	{ cols: [	{value:"	8	"},	{value:"		"},	{value:"	общ	"},	{value:"	МатК	"},	{value:"		"},	{value:"	eng	"},	{value:"	tur	"},	{value:"		"},		{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"},	{value:"		"}	] }
],																																													
5 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	общ	"},	{value:"	Геом	"},	{value:"	геогр	"},	{value:"	рус	"},	{value:"	мат	"},	{value:"	Физ-ра	"},	{value:"	рус	"},		{value:"	ист	"},	{value:"	общ	"},	{value:"	Емат	"},	{value:"	англ	"},	{value:"	инфа	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	мат	"},	{value:"	Р яз	"},	{value:"	физика	"},	{value:"	рус	"},	{value:"	math	"},	{value:"	Физ-ра	"},	{value:"	рус	"},		{value:"	общ	"},	{value:"	хим	"},	{value:"	Емат	"},	{value:"	физика	"},	{value:"	общ	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	math	"},	{value:"	Физ-ра	"},	{value:"	рус	"},	{value:"	мат	"},	{value:"	инфа	"},	{value:"	лит	"},	{value:"	хим	"},		{value:"	мат	"},	{value:"	мат	"},	{value:"	англ	"},	{value:"	общ	"},	{value:"	физика	"},	{value:"	Эко	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	англ	"},	{value:"	Физ-ра	"},	{value:"	англ	"},	{value:"	Р яз	"},	{value:"	лит	"},	{value:"	ист	"},	{value:"	мат	"},		{value:"	физика	"},	{value:"	Биол	"},	{value:"	рус	"},	{value:"	Емат	"},	{value:"	Емат	"},	{value:"	мат	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	рус	"},	{value:"	Биол	"},	{value:"	eng	"},	{value:"	ист	"},	{value:"	тех	"},	{value:"	физика	"},	{value:"	Р яз	"},		{value:"	англ	"},	{value:"	лит	"},	{value:"	физ-ра	"},	{value:"	Емат	"},	{value:"	Емат	"},	{value:"	мат	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	тех	"},	{value:"	рус	"},	{value:"	тех	"},	{value:"	тур	"},	{value:"	англ	"},	{value:"	Емат	"},	{value:"	физика	"},		{value:"	лит	"},	{value:"	физ-ра	"},	{value:"	общ	"},	{value:"	ист	"},	{value:"	лит	"},	{value:"	хим	"}	] },
	{ cols: [	{value:"	7	"},	{value:"	физ-ра	"},	{value:"	eng	"},	{value:"	тех	"},	{value:"	eng	"},	{value:"	tur	"},	{value:"	Емат	"},	{value:"	инфа	"},		{value:"	лит	"},	{value:"	физика	"},	{value:"	общ	"},	{value:"	Ерус	"},	{value:"	Ерус	"},	{value:"	ист	"}	] },
	{ cols: [	{value:"	8	"},	{value:"		"},	{value:"	tur	"},	{value:"	Физ-ра	"},	{value:"	тех	"},	{value:"		"},	{value:"		"},	{value:"		"},		{value:"		"},	{value:"	англ	"},	{value:"		"},	{value:"	Ерус	"},	{value:"	Ерус	"},	{value:"		"}	] }
],																																													
6 => [																																													
	{ cols: [	{value:"	1	"},	{value:"	тех	"},	{value:"	ИЗО	"},	{value:"	Алг	"},	{value:"	физ-ра	"},	{value:"	англ	"},	{value:"	мат	"},	{value:"	геогр	"},		{value:"	физика	"},	{value:"	лит	"},	{value:"	Биол	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	Право	"}	] },
	{ cols: [	{value:"	2	"},	{value:"	геогр	"},	{value:"	физ-ра	"},	{value:"	Геом	"},	{value:"	рус	"},	{value:"	eng	"},	{value:"	инфа	"},	{value:"	Емат	"},		{value:"	физика	"},	{value:"	лит	"},	{value:"	физика	"},	{value:"	мат	"},	{value:"	мат	"},	{value:"	общ	"}	] },
	{ cols: [	{value:"	3	"},	{value:"	мат	"},	{value:"	Алг	"},	{value:"	муз	"},	{value:"	ИЗО	"},	{value:"	геогр	"},	{value:"	физ-ра	"},	{value:"	физ-ра	"},		{value:"	мат	"},	{value:"	мат	"},	{value:"	Право	"},	{value:"	физика	"},	{value:"	физика	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	4	"},	{value:"	math	"},	{value:"	рус	"},	{value:"	ИЗО	"},	{value:"	геогр	"},	{value:"	физ-ра	"},	{value:"	Биол	"},	{value:"	лит	"},		{value:"	мат	"},	{value:"	мат	"},	{value:"	tur	"},	{value:"	инфа	"},	{value:"	англ	"},	{value:"	англ	"}	] },
	{ cols: [	{value:"	5	"},	{value:"	math	"},	{value:"	eng	"},	{value:"	рус	"},	{value:"	мат	"},	{value:"	ИЗО	"},	{value:"	рус	"},	{value:"	tur	"},		{value:"	мат	"},	{value:"	мат	"},	{value:"	англ	"},	{value:"	хим	"},	{value:"	тур	"},	{value:"	Физ-ра	"}	] },
	{ cols: [	{value:"	6	"},	{value:"	ИЗО	"},	{value:"	tur	"},	{value:"	eng	"},	{value:"	Биол	"},	{value:"	физика	"},	{value:"	рус	"},	{value:"	физика	"},		{value:"	инфа	"},	{value:"	tur	"},	{value:"	мат	"},	{value:"	рус	"},	{value:"	хим	"},	{value:"	Физ-ра	"}	] }
]																																													
																																													
																																													
																																													
																																													
																																													
																																													
																																													
																															
																																							
																																											
																																													
																																	
																																																																											
}


def get_lesson(h, m)
	if (h == 8 and m >= 30 and m <= 59) or (h == 9 and m >= 0 and m <= 15)
		out = 1
	elsif (h == 9 and m >= 25 and m <= 59) or (h == 10 and m >= 0 and m <= 10)
		out = 2
	elsif (h == 10 and m >= 20 and m <= 59) or (h == 11 and m >= 0 and m <= 5)
		out = 3
	elsif (h == 11 and m >= 15 and m <= 59) or (h == 12 and m == 0)
		out = 4
	elsif (h == 12 and m >= 40 and m <= 59) or (h == 13 and m >= 0 and m <= 25)
		out = 5
	elsif (h == 13 and m >= 35 and m <= 59) or (h == 14 and m >= 0 and m <= 20)
		out = 6
	elsif (h == 14 and m >= 30 and m <= 59) or (h == 15 and m >= 0 and m <= 15)
		out = 7
	elsif (h == 15 and m >= 25 and m <= 59) or (h == 16 and m >= 0 and m <= 5)
		out = 8
	else
		out = -1
	end

end

prev = 0
prev_wday = -1
# :first_in sets how long it takes before the job is first run. In this case, it is run immediately

#SCHEDULER.every '5m',  :first_in => 0 do |job|
SCHEDULER.every '1m',  :first_in => 0 do |job|
	rows = ''
	time = Time.new
	uri = URI('http://127.0.0.1:8000/front/get_timetable/1/')
	tmtable = JSON.parse(Net::HTTP.get(uri))
	wday = time.wday
	# if jobs runs overnight, thus prev>0 (for ex, 8),
	# timetable for the previous day is showed until 1st lesson =>
	# no new timetable at beginning of the school day
	if wday != prev_wday
		prev = 0
		prev_wday = wday
	end
	h = (time.hour + 3) % 24
	m = time.min
	index = get_lesson(h,m)
	if prev == 0 || index > prev
		# not Sunday
		if wday > 0
			if timetable[wday]
				# if not cloned, class parameter remains in next cycles!
				rows = Marshal.load(Marshal.dump(timetable[wday]))

				if index > 0  && index <= rows.length
					rows[index-1][:class] = "active"
				end
			end
		else
				rows = 	[
							{
								cols:
									[
										{value:"	1	"},	{value:"В"},	{value:"Ы"},	{value:"Х"},	{value:"О"},	{value:"Д"},	{value:"Н"},	{value:"О"},	{value:"Й"},	{value:"!"},	{value:"	1	"},	{value:"У"},	{value:"Р"},	{value:"А"},	{value:"!"}
									]
							}
						]
		end
			send_event('timetable', tmtable)
	  	# send_event('timetable', {
			#   		headers: [
			# 			{value:"	  	"},{value:"	5A	"},	{value:"	6A	"},	{value:"	7А	"},	{value:"	7Б	"},	{value:"	8А	"},	{value:"	8Б	"},	{value:"	9А	"},	{value:"	9Б	"},	{value:"	10A тех	"},	{value:"	10Б тех	"},	{value:"	11A	"},	{value:"	11Б	"},	{value:"	11С	"}
			#   		],
			#   		rows: rows
		  # 		}

		# )
		prev = index
	end
end
