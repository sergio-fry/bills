Feature: Income

	Org owner can track incomes


	Background:
		Given organization "Team A"
		And member "Ivan" of Organization "Team A"
		And logged in as owner of Organization "Team A"


	Scenario: I can track incomes
		When visit "Team A" organization page
		And click on "Track Income"
		And fill in "Amount" with "100"
		And select "Ivan" from "Member"
		And click on "Track"

		Then visit "Team A" organization page
		And see text "Balance: 100"
