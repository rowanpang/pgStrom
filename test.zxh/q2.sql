SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 GROUP BY cat;
