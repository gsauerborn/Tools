# preprocessor (shouldn't need this)
# break records into 1-per line. 
# don't print weekends.  (don't know how best to skip non=weekend holidays)
# turns this:
# Saturday, May 31, 2025 $724.39 Friday, May 30, 2025 $577.55 Thursday, May 29, 2025 $577.55 Wednesday, May 28, 2025 $29.56
# into this:
# Friday, " May 30, 2025 ",  $577.55
# Thursday, " May 29, 2025 ",  $577.55
# Wednesday, " May 28, 2025 ",  $29.56

BEGIN {
	# each space separates a field. there are 5-fields in a record
	# change default record separator (RS) from "," to " "

	RS=" ";
	    DEBUG = 0;


}
# EVERY 5th space begins a new record
{
	day=$1
	getline
	month=$1
	getline
	dayofmonth=$1
	getline
	year=$1
	getline
	balance=$1

	# fields now are:
	#	 Wednesday, " May 28, 2025 ",  $29.56

	# strip commas from dollars;
	# /,/s///
	value = balance;
	if (DEBUG) {
		print "'before gensub value ='" value
	}

	value = gensub(/[,]/,"","g",value);
	if (DEBUG) print num " after gensub value = " value

	# output:
	#	 Wednesday, " May 28, 2025 ",  $29.56

	#month = gensub(/^ /,"","g",month);



	# don't print Saturday or Sundays 
	if ( day !~ /^S/ ) { 
		# it is NOT a WeekEnd 
		print "\"" month,  dayofmonth , year  "\", ", value  
	}
}


