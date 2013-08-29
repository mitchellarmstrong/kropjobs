require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML (open("http://www.krop.com/#!/"))
jobs =  page.css("div#page div#fold div#content div.sized div#job-search-view div.main div#job-search-results.paginated div.results ul li.hot a.title")
location = page.css("div#page div#fold div#content div.sized div#job-search-view div.main div#job-search-results.paginated div.results ul li.hot a.location")
company = page.css("div#page div#fold div#content div.sized div#job-search-view div.main div#job-search-results.paginated div.results ul li.hot a.company")


File.open("jobs.html", "w") do |f|
	f.puts("<html>")
	f.puts("<link rel='stylesheet' type='text/css' href='jobs_style.css'>")

		f.puts("<head>")
		f.puts("	<title>Job Openings</title>")
		f.puts("</head>")

		f.puts("<body>")

		f.puts("<div id='container'>")

			#header_____________________
				f.puts("<div id='header'>")
				f.puts("<div id='logo'><img src='images/logo.png'></div>")
				f.puts("</div>")
			#headline image______________
				f.puts("<div id='headline-image'>")
				f.puts("<div id='logo'><img src='images/head_image.png'></div>")
				f.puts("</div>")

			#subheading__________________
			f.puts("<div id='title-bar'>")



			#titles___________________
			f.puts("<div id='job-title'>")
					f.puts("<h2>Jobs</h2>")
			f.puts("</div>")

			f.puts("<div id='loc-title'>")
					f.puts("<h2>Location</h2>")
			f.puts("</div>")

			f.puts("<div id='comp-title'>")
					f.puts("<h2>Company</h2>")
			f.puts("</div>")

			f.puts("</div>")

			#job scrape___________
				f.puts("<div id='job-container'>")


					f.puts("	<ul id='jobs'>")
						jobs.each do |job|
							f.puts("	<li>" + job.text + "</li>")
						end
					f.puts("</ul>")
				f.puts("</div>")



				#location scrape__________
				f.puts("<div id='loc-container'>")


					f.puts("	<ul id='locs'>")
						location.each do |locate|
							f.puts("	<li>" + locate.text + "</li>")
						end
					f.puts("</ul>")
				f.puts("</div>")

				#company scrape__________
				f.puts("<div id='company-container'>")


					f.puts("	<ul id='company'>")
						company.each do |comp|
							f.puts("	<li>" + comp.text + "</li>")
						end
					f.puts("</ul>")
				f.puts("</div>")





			#footer_______________
				f.puts("<div id='footer'>")
				#f.puts("<div id='logo'><img src='images/'></div>")
				f.puts("</div>")



		f.puts("</div>")


		f.puts("</body>\n")

	f.puts("</html>\n")

end

