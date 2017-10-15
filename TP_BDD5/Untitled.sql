SELECT code_j, titre
FROM journal
group by titre
HAVING prix < min(prix)*2;

SELECT n_dep
FROM livraison
GROUP BY n_dep
HAVING count(Code_j)>1;

SELECT n_dep
FROM livraison
GROUP BY n_dep
HAVING count ;