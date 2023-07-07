Feature: Income

	Org owner can track incomes


	Background:
		Given logged in user
		And create organization "Team A"
		And add member "Ivan" to organization
		And add member "Petr" to organization


	Scenario: I can track incomes
		When visit organization page

		And track income "100" by "Ivan"
		Then organization balance is "100"

		And track income "10" by "Petr"
		Then organization balance is "110"
