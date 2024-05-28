USE pubs;

#Q1
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
    authors AS a
JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN
    titles AS t ON ta.title_id = t.title_id
JOIN
    publishers AS p ON t.pub_id = p.pub_id
ORDER BY 
    a.au_id, t.title;
    
#Q2
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(t.title_id) AS 'NUMBER OF TITLES'
FROM
    authors AS a
JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN
    titles AS t ON ta.title_id = t.title_id
JOIN
    publishers AS p ON t.pub_id = p.pub_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY
    'NUMBER OF TITLES' DESC, a.au_id, p.pub_name;

#Q3
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    SUM(s.qty) AS 'TOTAL'
FROM
    authors AS a
JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN
    titles AS t ON ta.title_id = t.title_id
JOIN
    sales AS s ON t.title_id = s.title_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname
ORDER BY
    TOTAL DESC
LIMIT 3;

#Q4
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COALESCE(SUM(s.qty), 0) AS 'TOTAL'
FROM
    authors AS a
LEFT JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
LEFT JOIN
    sales AS s ON t.title_id = s.title_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname
ORDER BY
    TOTAL DESC;