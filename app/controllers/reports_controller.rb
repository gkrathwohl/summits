class ReportsController < ApplicationController
	def index
	end

	def annual_report

		@a = [["a","b"],[1,2]]

		response.headers['Content-Type'] = 'text/csv'
		response.headers['Content-Disposition'] = 'attachment; filename=report.csv'
		render "annual_report", layout: false
	end
end