Feature: Home page

	Anyone can visit root page


	Scenario: Guest visits root page and can see some welcome text
		When Visit "/"
		Then See text "Welcome"
