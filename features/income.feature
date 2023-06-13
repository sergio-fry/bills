Feature: Income

	Org owner can track incomes


	Background:
		Given organization "Team A"
		And logged in as owner of organization
		And member "Ivan" added to organization
		And member "Petr" added to organization


	Scenario: I can track incomes
		When visit "Team A" organization page

		And click on "track income"
		And fill in "Amount" with "100"
		And select "Ivan" from "Member"
		And click on "add"

		And click on "track income"
		And fill in "Amount" with "10"
		And select "Petr" from "Member"
		And click on "add"

		Then visit "Team A" organization page
		And see text "$110.00"
