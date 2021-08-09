/* Query-1 */

/* What are the Six most Popular Genres for Customer In Indaia */

SELECT g.Name, sum(il.quantity) Genre_Purchases
FROM invoice i
JOIN invoiceline il
ON i.invoiceid = il.invoiceid
JOIN track t 
ON il.trackid = t.trackid
JOIN genre g
ON t.genreid = g.genreid
WHERE BillingCountry = 'India'
GROUP BY 1
ORDER BY 2 DESC
limit 6;



/* Query -2 */ 

/* What are the Top 10 genres Purchased between 2010 and 2013 */

SELECT g.Name Genre_Name, sum(il.quantity) Genre_Purchases
FROM invoice i
JOIN invoiceline il
ON i.invoiceid = il.invoiceid
JOIN track t 
ON il.trackid = t.trackid
JOIN genre g
ON t.genreid = g.genreid
WHERE invoicedate BETWEEN '2010-01-01' AND '2013-01-01'
GROUP BY 1
ORDER BY 2 DESC
limit 10



/* Query -3 */


/* What are the top 5 Selling Artist in the Rock Genre */

SELECT ar.name, sum(il.unitprice*il.quantity) Artist_Sales
FROM invoice i
JOIN invoiceline il
ON i.invoiceid = il.invoiceid
JOIN track t 
ON il.trackid = t.trackid
JOIN album al
ON t.albumid = al.albumid
JOIN artist ar
ON al.artistid = ar.artistid
WHERE t.genreid = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5



/* Query -4 */

/* What are the total earnings of Top 5 Artists */

SELECT
  Artist.Name,
  SUM(il.UnitPrice * il.Quantity) AS ArtistEarnings
FROM Invoice i
JOIN InvoiceLinec il
  ON il.InvoiceId = i.InvoiceId
JOIN Track t
  ON t.TrackId = il.TrackId
JOIN Album al
  ON t.AlbumId = al.AlbumId
JOIN Artist ar
  ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId
ORDER BY ArtistEarnings DESC
LIMIT 5;


