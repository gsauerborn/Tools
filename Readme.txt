20250530

"simple" awk script to read my daily balance cut from the Schwab website page.  I asked the Windows Copilot create it, but lost my original prompt.
I finally basically rewrote most of it.

usage:  awk -f tbl2csv.awk < input.txt > output.csv

Input is very data specific.  The spreadsheet reading the output CSV file needs to use DATEVALUE() and VALUE() to read the date and balance lines.
It only outputs weekdays (trading days) but knows nothing about weekday holidays.

example input:
Saturday, May 31, 2025 $724.39 Friday, May 30, 2025 $577.55 Thursday, May 29, 2025 $577.51

example output:
"May 30, 2025",  $577.55
"May 29, 2025",  $577.51

