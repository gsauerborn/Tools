20250530

Motivation: Want to be able to easily track the moving average of my porfolio(s), balance.
IBD's Justin Nelson and Mike Webster will track it's 10-DAY SMA to and start liquidating if the porfolio's ballance goes below the SMA.

If I can get the data another way, I'll be happy to delete this script & repo.

tbl2csv.awk is a "simple" awk script to read my daily balance cut from the Schwab website page.  I asked the Windows Copilot create it, but lost my original prompt.
I finally basically rewrote most of it.

usage:  awk -f tbl2csv.awk < input.txt > output.csv

Input is very data specific.  (Spefically, extra spacing between fields needs to be fixed in the data set before reading!) 
Output: The spreadsheet reading the output (generated CSV file) needs to use DATEVALUE() and VALUE() to read the date and balance lines.
It only outputs weekdays (trading days) but knows nothing about weekday holidays.

example input:
Saturday, May 31, 2025 $724.39 Friday, May 30, 2025 $577.55 Thursday, May 29, 2025 $577.51

example output:
"May 30, 2025",  $577.55
"May 29, 2025",  $577.51

