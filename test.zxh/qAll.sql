\timing on
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 GROUP BY cat;
\echo "q1 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 GROUP BY cat;
\echo "q2 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 GROUP BY cat;
\echo "q3 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 NATURAL JOIN t4 GROUP BY cat;
\echo "q4 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 NATURAL JOIN t4 NATURAL JOIN t5 GROUP BY cat;
\echo "q5 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 NATURAL JOIN t4 NATURAL JOIN t5 NATURAL JOIN t6 GROUP BY cat;
\echo "q6 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 NATURAL JOIN t4 NATURAL JOIN t5 NATURAL JOIN t6 NATURAL JOIN t7 GROUP BY cat;
\echo "q7 end"
SELECT cat, count(*), avg(ax) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2 NATURAL JOIN t3 NATURAL JOIN t4 NATURAL JOIN t5 NATURAL JOIN t6 NATURAL JOIN t7 NATURAL JOIN t8 GROUP BY cat;
\echo "q8 end"
SELECT cat, count(*) FROM t0 NATURAL JOIN t1 NATURAL JOIN t2  WHERE sqrt((ax-20)^2 + (bx-30)^2) < 10 GROUP BY cat;
\echo "q9 end"
