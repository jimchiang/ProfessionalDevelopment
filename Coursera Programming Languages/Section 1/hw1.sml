fun is_older (x : int*int*int, y : int*int*int) = 
    let fun is_older_rec(xs : int list, ys : int list) =
	    if null xs andalso null ys
	    then false
	    else if hd xs < hd ys
	    then true
	    else if hd xs > hd ys
	    then false
	    else is_older_rec(tl xs, tl ys)
    in
	is_older_rec([#1 x, #2 x, #3 x], [#1 y, #2 y, #3 y])			
    end

fun test1 () =
    let
	val a = (1999, 1, 1)
	val b = (2222, 2, 2)
	val c = (1999, 1, 4)
	val result = [is_older(a,b), is_older(b,a), is_older(a, c)]
    in
	result
    end

fun number_in_month (ds : (int*int*int) list, m : int) =
    let
	fun f(x : int) =
	    if x = m then 1 else 0
    in
	if null ds
	then 0
	else f(#2 (hd ds)) + number_in_month(tl ds, m)
    end    

fun test2 () =
    let
	val a = (1999, 1, 1)
	val b = (2222, 2, 2)
	val c = (1999, 1, 4)
	val ds = [a, b, c]		 
	val result =  number_in_month (ds, 1)
    in
	result
    end

fun number_in_months (ds : (int*int*int) list, ms : int list) =
    if null ds orelse null ms
    then 0
    else number_in_month(ds, hd ms) + number_in_months(ds, tl ms)

fun test3 () =
    let
	val a = (1999, 1, 1)
	val b = (2222, 2, 2)
	val c = (1999, 1, 4)
	val ds = [a, b, c]		 
	val ms = [1, 2]
	val result =  number_in_months(ds, ms)
    in
	result
    end

fun dates_in_month (ds : (int*int*int) list, m : int) =
    let
	val result = []
	fun lambda (ds : (int*int*int) list) =
	    if number_in_month(ds, m) = 1
	    then hd ds
else 

    in
	
    


	
