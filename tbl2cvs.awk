#!/usr/bin/awk -f

BEGIN {
    FS = ", ";  # Field separator for parsing
    OFS = ",";  # Output separator for CSV format
    line = 0;
    value = "0.0";
    DEBUG = 0;
    inputstr = "xxxemptyxxxstring";
}



{
        if (DEBUG) {
                print "at the very start line $0 is:" $0
		print "note some fields: $6 = " $6
		print "note some fields: $5 = " $5
  		print "note some fields: $12 = " $12


        }
    # Use regex to find records
    inputstr = $0
    match(inputstr, /([A-Za-z]+), ([A-Za-z]+) ([0-9]{1,2}), ([0-9]{4}) \$([0-9,]+\.[0-9]{2})/, arr)
    while (arr[0] != "") {
	line = line + 1   
	# strip commas from dollars;
	# /,/s///
	value = arr[5]
	if (DEBUG) {
		print "'before gensub value ='" value
	}
	endofthisfield = value;

	value = gensub(/[,]/,"","g",arr[5]);
	if (DEBUG) print num " after gensub value = " value

	
        print line, arr[1], arr[2], arr[3], arr[4], value;
        #print line, arr[1], arr[2], arr[3], arr[4], arr[5];

        # Remove the processed portion from $0 and continue
        #nsubd = sub(arr[0], "", inputstr);
	#search for endofthisfield
	sstr = "/" + endofthisfield + "/";
	if (DEBUG) {
		print "will be looking for :'" sstr   "'";
		print "endofthisfield =    :'" endofthisfield  "'";
		#print "inputstr[50] = =    :'" inputstr[50]   "'";
	}


	nsubd = sub(inputstr, sstr, inputstr);
	if (DEBUG) {
		print "nsubd = " nsubd "$0 now is:" $0
		print "inputstr now is: " inputstr
	}
        num = match(inputstr, /([A-Za-z]+), ([A-Za-z]+) ([0-9]{1,2}), ([0-9]{4}) \$([0-9,]+\.[0-9]{2})/, arr);
	if (line > 10)  {
 		break
	}
	#print num " matches";

    }
}
