-- At least four of your queries (saved as views) should involve multiple (two or more) tables, and thus involve JOIN clauses. (Requirement A)
-- At least three of your queries should involve some form of filtering (WHERE, HAVING, etc.) (Requirement B) 				 				 		
-- At least two of your queries should involve some form of aggregation over records (SUM, COUNT, AVERAGE, GROUP BY, etc.) 
-- These cannot be queries that simply count the number of rows in a given table, such as SELECT COUNT(invoice_id) FROM invoices. (Requirement C)	


-- USE Costco;
-- SELECT CONCAT(street_name, ',', city , ',', state, ',', zipcode) AS location_address,
-- 	CONCAT(brand_name, ',', item_names) AS items,
-- 	quantity,
--     sold_quantity,
--     (quantity - sold_quantity) AS in_stocks
--     
-- FROM Inventory 
-- 	JOIN Location  USING (store_id)
--     JOIN `Sales Movement` USING (inventory_id)
-- ORDER BY in_stocks

/*Query for vewing */
USE Costco;
-- CREATE OR REPLACE VIEW Membership_number AS
SELECT m.store_id,
	CONCAT(l.street_name, ',', l.city , ',', l.state, ',', l.zipcode) AS location_address,
    COUNT(type_of_membership) AS num_gold_membership
    
FROM location l
	JOIN Membership m USING (store_id)
	WHERE m.type_of_membership = 'Gold'
    
GROUP BY m.store_id
ORDER BY num_gold_membership DESC;


/*Query for vewing */
use Costco;
CREATE OR REPLACE VIEW Membership_number AS
WITH gold AS
(
	SELECT store_id, COUNT(m1.type_of_membership) AS num_gold_membership
    FROM location l1
	JOIN Membership m1 USING (store_id)
	WHERE m1.type_of_membership = 'Gold'
    GROUP BY store_id
),

business AS
(
	SELECT store_id, COUNT(m2.type_of_membership) AS num_business_membership
    FROM location l2
	JOIN Membership m2 USING (store_id)
	WHERE m2.type_of_membership = 'Business'
    GROUP BY store_id
),

executive AS
(
	SELECT store_id, COUNT(m3.type_of_membership) AS num_executive_membership
    FROM location l3
	JOIN Membership m3 USING (store_id)
	WHERE m3.type_of_membership = 'Business'
    GROUP BY store_id
)

SELECT 
	l.store_id,
    CONCAT(l.street_name, ',', l.city , ',', l.state, ',', l.zipcode) AS location_address,
	gold.num_gold_membership,
    business.num_business_membership,
    executive.num_executive_membership

FROM location l
LEFT JOIN gold ON gold.store_id = l.store_id
LEFT JOIN business ON business.store_id = l.store_id
LEFT JOIN executive ON executive.store_id = l.store_id
ORDER BY num_executive_membership DESC;



    