Feature: Home page

	Anyone can visit root page


	Scenario: Guest visits root page and can see some welcome text
		When visit "/"
		Then see text "welcome"
