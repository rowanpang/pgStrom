SELECT cat, count(*) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 WHERE sqrt((ax-20)^2 + (bx-30)^2) < 10 GROUP BY cat;
