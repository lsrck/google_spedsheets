require "google_drive"
require_relative "scrapping.rb"


puts $mon_hash
# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
$ws = session.spreadsheet_by_key("1CEno9ROdhiZPPTkOCNCUIYD00q1-Y3lM7u2jYY2IDA0").worksheets[0]

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().

def print_lines
	i = 2
$mon_hash.each {|key, value|
$ws[i, 1] = key
$ws[i, 2] = value
i+=1
}
$ws.save
end

print_lines