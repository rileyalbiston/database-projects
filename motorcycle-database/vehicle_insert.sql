

-- psql -U postgres -d vehicle_maintenance 


INSERT INTO vehicle
    (make, model, year, description)
VALUES
    ('Honda', 'XR650R', 2000, 'Its a Honda XR650R, best bike ever!!!'),
    ('Chevrolet', 'Camaro IROCZ', 1986, 'My kick-arse Camaro. Hopefully itll be getting an LS1 soon.');

SELECT * FROM vehicle;



INSERT INTO category
    (category)
VALUES
    ('Engine'),
    ('Suspension'),
    ('Wheels/Tyres'),
    ('Fuel System'),
    ('Tansmission'),
    ('Electrical'),
    ('Drivetrain'),
    ('Body/Panels'),
    ('Interior'),
    ('Chasis/Frame'),
    ('Bearings'),
    ('Service Consumables');

SELECT * FROM category;



INSERT INTO part 
	(brand, part_number, description, category_id, vehicle_id)
VALUES
	('UMI Performance', 2406, '1974-1992 GM F-Body, 1978-1988 GM G-Body LSX Motor Mounts', (select id from category where category = 'Chasis/Frame'), (select id from vehicle where model = 'Camaro IROCZ'));

SELECT * FROM part;



INSERT INTO link
	(url, part_id)
VALUES 
	('http://umiperformance.com/catalog/index.php?main_page=product_info&cPath=6_311&products_id=692', (select id from part where description = '1974-1992 GM F-Body, 1978-1988 GM G-Body LSX Motor Mounts'));

SELECT * FROM link;