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

fun number_in_month (ds : (int*int*int) list, m : int) =
    let
	fun f(x : int) =
	    if x = m then 1 else 0
    in
	if null ds
	then 0
	else f(#2 (hd ds)) + number_in_month(tl ds, m)
    end    


fun number_in_months (ds : (int*int*int) list, ms : int list) =
    if null ds orelse null ms
    then 0
    else number_in_month(ds, hd ms) + number_in_months(ds, tl ms)


fun dates_in_month (ds : (int*int*int) list, m : int) =
    let 
	val result = []
    in		     
	if null ds 
	then []
	else if #2 (hd ds) = m
	then (hd ds)::dates_in_month(tl ds, m)
	else dates_in_month(tl ds, m)
    end


fun dates_in_months (ds : (int*int*int) list, ms : int list) =
    if null ds orelse null ms
    then []
    else dates_in_month(ds, hd ms) @ dates_in_months(ds, tl ms)
	

fun get_nth (ds : string list, ms : int) =
    if ms = 1
    then hd ds
    else get_nth (tl ds, ms - 1)

val  monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

fun date_to_string (d : int*int*int) =
    let
	val index  = #2 d
	val monthString = List.nth(monthNames, index-1)			  
    in
	monthString ^ " " ^ Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d)
    end


fun number_before_reaching_sum (sum : int, xs : int list) =
    if hd xs >= sum
    then 0
    else 1 + number_before_reaching_sum(sum-(hd xs), tl xs)


fun what_month (day : int) =
    let 
	val daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(day, daysInMonth) + 1
    end

fun countup_from1_better (x : int) =
    let fun count (from:int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count 1
    end

fun month_range (day1 : int, day2 : int) = 
    let
	fun count(from : int) =
	    if from > day2
	    then []
	    else if from = day2 
	    then what_month(day2)::[]
	    else what_month(from)::count(from+1)
    in
	count(day1)
    end

fun oldest (ds : (int*int*int) list) =
    if null ds
    then NONE
    else
	let
	    val tl_ans = oldest(tl ds)
	in 
	    if isSome tl_ans andalso is_older(valOf tl_ans, hd ds)
	    then tl_ans
	    else SOME (hd ds)
	end



