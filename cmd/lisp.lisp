(defmacro times (c b)
	`(progn
		(def (_l) (0))
		(while (lt _l ,c)
			,b
			(setl (_l) ((add _l 1))))))

(defmacro do11 (f)
	`(for 0 11 1 ,f))

(defmacro for (s e i f)
	`(progn
		(def (_l) (,s))
		(while (lt _l ,e)
			(,f _l)
			(setl (_l) ((add _l ,i))))))

(defmacro do10 (f)
	`(for 0 10 1 ,f))

(def (gte lte gt)
	((lambda (x y)
		(not (lt x y)))
	(lambda (x y)
		(or (lt x y) (eq x y)))
	(lambda (x y)
		(not (or (lt x y) (eq x y))))))

(def (eql)
	((lambda (x y)
		(eq (str x) (str y)))))

(def (zip1 zip2 zip3 zip4)
	((lambda (a)
		(map list a))
	(lambda (a b)
		(map list a b))
	(lambda (a b c)
		(map list a b c))
	(lambda (a b c d)
		(map list a b c d))))

(def (merge2 merge3 merge4)
	((lambda (a b)
		(reduce cat (zip2 a b)))
	(lambda (a b c)
		(reduce cat (zip3 a b c)))
	(lambda (a b c d)
		(reduce cat (zip4 a b c d)))))

(def (squared cubed divmod)
	((lambda (x)
		(mul x x))
	(lambda (x)
		(mul x x x))
	(lambda (x y)
		(list (div x y) (mod x y)))))

(def (print_map)
	((lambda (m)
		(progn
			(map print m)
			t))))

(def (print_env)
	((lambda (l e)
		(progn
			(print "**" l "**")
			(map print_map e)
			t))))

(def (prin_num)
	((lambda (n p c)
		(progn
			(def (s) ((str n)))
			(def (l) ((length s)))
			(while (lt l p)
				(prin c)
				(setl (l) ((add l 1))))
			(prin s)))))

(def (fq)
	((lambda (x y)
		(mod (mul (cubed x) (squared y)) 10))))

(def (fxy)
	((lambda (f w h)
		(progn
			(def (x y) (1 1))
			(until (lt h y)
				(setl (x) (1))
				(until (lt w x)
					(prin_num (f x y) 4 ".")
					(setl (x) ((add x 1))))
				(setl (y) ((add y 1)))
				(print))))))

(def (repeat_fxy)
	((lambda (l)
		(progn
			(def (c) (0))
			(while (lt c l)
				(fxy fq 10 20)
				(setl (c) ((add c 1))))))))
