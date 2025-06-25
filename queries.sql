→ Challenge : Handling 'Inactive' Driver Status 

SELECT s.shipment_id, p.package_id, p.weight, p.status  d.driver_id, d.phone_no, d.status , 
t.status 
FROM Shipment  AS s 
JOIN Package AS  p ON s.package_id = p.package_id 
JOIN Tracking AS t ON s.shipment_id = t.shipment_id 
JOIN Driver AS d ON s.driver_id = d.driver_id 
JOIN Send AS se ON p.package_id = se.package_id 
JOIN User AS u ON se.sender = u.userid 
WHERE u.userid = 'USER123' AND d.status = 'Active'; 

→ Challenge : Same City And  Delivery Time Is Not Null  

SELECT u1.name AS sender_name, u2.name , u1.city, sh.delivery_time 
FROM user AS  u1 
JOIN Send AS s ON u1.userid = s.sender 
JOIN user AS u2 ON s.receiver = u2.userid 
JOIN Shipment AS sh ON s.package_id = sh.package_id 
WHERE u1.city = u2.city AND sh.delivery_time IS NOT NULL; 

→ Challenge : Payment Must Be Cleared for Delivery 

SELECT u.name, u.city, sh.driver_id, sh.delivery_time 
FROM user  AS u 
JOIN Payment  AS p ON u.userid = p.userid 
JOIN Shipment AS sh ON p.payment_id = sh.payment_id 
WHERE p.status = 'completed'  AND  sh.delivery_time IS NOT NULL;