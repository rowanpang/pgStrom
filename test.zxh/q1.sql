SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 GROUP BY cat;
