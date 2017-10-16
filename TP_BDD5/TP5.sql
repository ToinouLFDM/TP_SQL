SELECT titre, prix, type, periode
FROM journal;

SELECT titre
FROM journal
ORDER BY titre;

SELECT code_j 
FROM journal
WHERE periode='MENSUEL';

SELECT * 
FROM journal
ORDER BY type,prix;

SELECT titre,n_dep
FROM journal,livraison
WHERE journal.CODE_J=livraison.code_j;

SELECT  min(prix), AVG(prix), max(prix)
FROM journal;

SELECT count(titre),count(distinct(type))
FROM journal;

SELECT code_j
FROM journal
WHERE type is NULL;

SELECT type,min(prix),AVG(prix), max(prix)
FROM journal
GROUP by type;


SELECT n_dep
FROM livraison
GROUP by n_dep
HAVING AVG(QTE_L)>15;


SELECT adr_j
from journal
GROUP BY adr_j
HAVING count(adr_j)>=5;



SELECT count(count(adr_j))
FROM journal
GROUP by adr_j
HAVING count(adr_j)>=4;

SELECT code_j
FROM depot,livraison
WHERE depot.N_DEP=livraison.n_dep and depot.ADR like 'BURES%';

SELECT code_j
FROM livraison
WHERE n_dep in (SELECT n_dep
                FROM depot
                WHERE depot.ADR like 'BURES%');

SELECT DISTINCT(code_j)
FROM depot,livraison
WHERE depot.N_DEP=livraison.n_dep and depot.NOM_DEP like 'LES BRASSEURS%';

SELECT DISTINCT(livraison.code_j),titre
FROM depot,livraison,journal
WHERE journal.code_j=livraison.code_j and depot.N_DEP=livraison.n_dep and depot.NOM_DEP like 'LES BRASSEURS%';       

SELECT count(DISTINCT(titre))
FROM depot,livraison,journal
WHERE journal.code_j=livraison.code_j and depot.N_DEP=livraison.n_dep and depot.NOM_DEP like 'LES BRASSEURS%';      



SELECT code_j, titre
FROM journal
WHERE (SELECT min(prix)*2
       FROM journal)<prix;

SELECT n_dep
FROM livraison
GROUP BY n_dep
HAVING count(code_j)>1;

SELECT n_dep,qte_l
FROM livraison
WHERE qte_l>=50
GROUP BY n_dep,qte_l
HAVING count(qte_l)>=3;

SELECT titre
FROM journal
WHERE code_j in( SELECT code_j
                   FROM livraison
                   WHERE code_j in (SELECT code_j
                                    FROM livraison
                                    GROUP BY code_j
                                    HAVING count(distinct(n_dep))>=5) and n_dep  in (SELECT n_dep
                                                                           FROM depot
                                                                           WHERE ADR='PARIS'));


SELECT DISTINCT(nom_dep) 
FROM depot
WHERE n_dep not in (SELECT  DISTINCT(n_dep)
                 FROM livraison
                 WHERE code_j in (SELECT code_j
                                      FROM journal
                                      WHERE titre = 'LIBERATION'));

SELECT DISTINCT(n_dep)
FROM livraison,journal
WHERE livraison.code_j=journal.code_j and journal.periode not in('QUOTIDIEN','MENSUEL') and journal.periode='HEBDO'
GROUP BY n_dep;


SELECT titre 
FROM journal;

SELECT titre
FROM journal 
WHERE code_j not in (SELECT code_j
                     FROM livraison
                     WHERE n_dep=310);
              
SELECT titre
FROM journal 
WHERE  code_j in (SELECT code_j
                  FROM livraison
                  WHERE n_dep=310);
         
           