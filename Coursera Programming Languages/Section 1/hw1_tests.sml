val a = (1999, 1, 1)
val b = (2222, 2, 2)
val c = (1999, 1, 4)
val ds = [a, b, c]		 
val ms = [1, 2]

fun test1 () =
    is_older(a,b) andalso (is_older(b,a) = false) andalso is_older(a, c)

fun test2 () =
    number_in_month (ds, 1) = 2;

fun test3 () =
    number_in_months(ds, ms) = 3

fun test4 () =
    dates_in_month (ds, 1) = [a, c]

fun test5 () =
    dates_in_months (ds, ms)

fun test6 () =
    let
	val a = "first"
	val b = "second"
	val c = "third"
	val strs = [a, b, c]
    in
	get_nth(strs, 3)
    end

fun test7 () =
    let
	val a = (1999, 1, 1)
	val b = (2222, 2, 2)
	val c = (1999, 1, 4)
	val d = (1,2,98)
	val e = (0,1,1) 
	val f = (3,2,1)
	val g = (6,3,1) 
    in		     
	[date_to_string (a), date_to_string (b), date_to_string (c), date_to_string (d), date_to_string (e), date_to_string (f), date_to_string (g)]
    end

fun test8 () =
    let
	val a = 1
	val b = 2
	val c = 5
	val daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	val xs = [a, b, c]
    in
	number_before_reaching_sum(30, daysInMonth)
    end

fun test9 () =
    let
	val a = 32
    in
	[what_month(32), what_month(365) ]
    end

fun test10 () =
   [month_range(1, 1), month_range(1, 2), month_range(30, 32), month_range(5,3)]

fun test11 () =
    oldest(ds);

(*
test1();
test2();
test3();
test4();
test5();
test6();
test7();
test8();
test9();
*)
test10();
test11();
