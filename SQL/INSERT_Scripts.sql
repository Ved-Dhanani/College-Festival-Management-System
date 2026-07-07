-- ============================================================
-- College Festival Management System
-- Purpose : Populate all 14 tables with sample data
-- ============================================================

-- College
INSERT INTO College VALUES(1,'Nirma University','Ahmedabad, Gujarat','info@nirmauni.ac.in');
INSERT INTO College VALUES(2,'DAIICT','Gandhinagar, Gujarat','contact@daiict.ac.in');
INSERT INTO College VALUES(3,'LD College of Engineering','Ahmedabad, Gujarat','ldce@ldce.ac.in');
INSERT INTO College VALUES(4,'Ahmedabad University','Ahmedabad, Gujarat','info@ahduni.edu.in');
INSERT INTO College VALUES(5,'CHARUSAT University','Anand, Gujarat','info@charusat.ac.in');

-- Committee
INSERT INTO Committee VALUES(1,'Cultural Committee',12,1);
INSERT INTO Committee VALUES(2,'Technical Committee',10,1);
INSERT INTO Committee VALUES(3,'Fest Core Committee',15,2);
INSERT INTO Committee VALUES(4,'Events Committee',8,3);
INSERT INTO Committee VALUES(5,'Management Committee',9,4);
INSERT INTO Committee VALUES(6,'Sports Committee',11,5);

-- Organizer
INSERT INTO Organizer VALUES(1,'Riya Shah','Computer Science','riya.shah@nirmauni.ac.in','9876543210',1);
INSERT INTO Organizer VALUES(2,'Arjun Mehta','Electronics','arjun.mehta@nirmauni.ac.in','9812345678',2);
INSERT INTO Organizer VALUES(3,'Pooja Patel','IT','pooja.patel@daiict.ac.in','9898765432',3);
INSERT INTO Organizer VALUES(4,'Karan Desai','Mechanical','karan.desai@ldce.ac.in','9745632180',4);
INSERT INTO Organizer VALUES(5,'Sneha Joshi','Civil','sneha.joshi@ahduni.edu.in','9654321098',5);
INSERT INTO Organizer VALUES(6,'Dev Trivedi','Computer Science','dev.trivedi@nirmauni.ac.in','9823456789',1);
INSERT INTO Organizer VALUES(7,'Ananya Rao','MBA','ananya.rao@daiict.ac.in','9701234567',3);
INSERT INTO Organizer VALUES(8,'Mihir Shah','Electrical','mihir.shah@charusat.ac.in','9611234567',6);

-- Festival
INSERT INTO Festival VALUES(1,'Nirmaitsav 2025','Cultural','2025-02-14','2025-02-16',1);
INSERT INTO Festival VALUES(2,'TechFest 2025','Technical','2025-03-01','2025-03-03',2);
INSERT INTO Festival VALUES(3,'iCultura 2025','Cultural','2025-01-20','2025-01-22',3);
INSERT INTO Festival VALUES(4,'Synergy 2025','Mixed','2025-04-05','2025-04-07',4);
INSERT INTO Festival VALUES(5,'Aaveg 2025','Cultural','2025-03-15','2025-03-17',5);
INSERT INTO Festival VALUES(6,'SportzMania 2025','Sports','2025-02-20','2025-02-22',6);

-- Event
INSERT INTO Event VALUES(1,'Battle of Bands','Music','Main Stage','2025-02-14','18:00',150.00,1);
INSERT INTO Event VALUES(2,'Dance Fever','Dance','Open Air Theater','2025-02-15','17:00',100.00,1);
INSERT INTO Event VALUES(3,'Nukkad Natak','Drama','Amphitheater','2025-02-16','16:00',50.00,1);
INSERT INTO Event VALUES(4,'Hackathon 2025','Technical','Lab Block A','2025-03-01','09:00',200.00,2);
INSERT INTO Event VALUES(5,'Robo Wars','Robotics','Sports Ground','2025-03-02','10:00',250.00,2);
INSERT INTO Event VALUES(6,'Paper Presentation','Academic','Seminar Hall','2025-03-03','11:00',0.00,2);
INSERT INTO Event VALUES(7,'Singing Competition','Music','Auditorium','2025-01-20','15:00',80.00,3);
INSERT INTO Event VALUES(8,'Treasure Hunt','Adventure','Campus Wide','2025-01-21','10:00',60.00,3);
INSERT INTO Event VALUES(9,'Fashion Show','Fashion','Ramp Area','2025-04-05','19:00',120.00,4);
INSERT INTO Event VALUES(10,'Quiz Competition','Academic','Seminar Hall 2','2025-04-06','11:00',30.00,4);
INSERT INTO Event VALUES(11,'Stand Up Comedy','Comedy','Main Auditorium','2025-03-15','20:00',180.00,5);
INSERT INTO Event VALUES(12,'Photography Contest','Art','Gallery Hall','2025-03-16','14:00',40.00,5);
INSERT INTO Event VALUES(13,'Cricket Tournament','Sports','Cricket Ground','2025-02-20','09:00',70.00,6);
INSERT INTO Event VALUES(14,'Badminton Championship','Sports','Indoor Stadium','2025-02-21','10:00',50.00,6);
INSERT INTO Event VALUES(15,'DJ Night','Music','Open Ground','2025-02-16','21:00',300.00,1);

-- Participant
INSERT INTO Participant VALUES(1,'Aarav Patel','Male','aarav.patel@gmail.com','9911223344','Nirma University');
INSERT INTO Participant VALUES(2,'Diya Shah','Female','diya.shah@gmail.com','9922334455','DAIICT');
INSERT INTO Participant VALUES(3,'Rohan Mehta','Male','rohan.mehta@gmail.com','9933445566','LD College of Engineering');
INSERT INTO Participant VALUES(4,'Priya Joshi','Female','priya.joshi@gmail.com','9944556677','Ahmedabad University');
INSERT INTO Participant VALUES(5,'Kush Trivedi','Male','kush.trivedi@gmail.com','9955667788','CHARUSAT University');
INSERT INTO Participant VALUES(6,'Mahi Desai','Female','mahi.desai@gmail.com','9966778899','Nirma University');
INSERT INTO Participant VALUES(7,'Vivek Rao','Male','vivek.rao@gmail.com','9977889900','DAIICT');
INSERT INTO Participant VALUES(8,'Anvi Sharma','Female','anvi.sharma@gmail.com','9988990011','LD College of Engineering');
INSERT INTO Participant VALUES(9,'Harsh Patel','Male','harsh.patel@gmail.com','9999001122','Nirma University');
INSERT INTO Participant VALUES(10,'Nidhi Bhatt','Female','nidhi.bhatt@gmail.com','9900112233','Ahmedabad University');
INSERT INTO Participant VALUES(11,'Yash Modi','Male','yash.modi@gmail.com','9811223344','CHARUSAT University');
INSERT INTO Participant VALUES(12,'Krisha Kapoor','Female','krisha.kapoor@gmail.com','9822334455','Nirma University');
INSERT INTO Participant VALUES(13,'Raj Solanki','Male','raj.solanki@gmail.com','9833445566','DAIICT');
INSERT INTO Participant VALUES(14,'Tanvi Nair','Female','tanvi.nair@gmail.com','9844556677','LD College of Engineering');
INSERT INTO Participant VALUES(15,'Dev Chauhan','Male','dev.chauhan@gmail.com','9855667788','Ahmedabad University');
INSERT INTO Participant VALUES(16,'Ishaan Verma','Male','ishaan.verma@gmail.com','9866778899','CHARUSAT University');
INSERT INTO Participant VALUES(17,'Riya Pandya','Female','riya.pandya@gmail.com','9877889900','Nirma University');
INSERT INTO Participant VALUES(18,'Siddharth Oza','Male','sid.oza@gmail.com','9888990011','DAIICT');
INSERT INTO Participant VALUES(19,'Zara Merchant','Female','zara.merchant@gmail.com','9899001122','LD College of Engineering');
INSERT INTO Participant VALUES(20,'Aryan Bhatt','Male','aryan.bhatt@gmail.com','9800112233','Ahmedabad University');

-- Registration
INSERT INTO Registration VALUES(1,1,1,'2025-02-01');
INSERT INTO Registration VALUES(2,2,1,'2025-02-02');
INSERT INTO Registration VALUES(3,3,2,'2025-02-03');
INSERT INTO Registration VALUES(4,4,2,'2025-02-03');
INSERT INTO Registration VALUES(5,5,3,'2025-02-04');
INSERT INTO Registration VALUES(6,6,4,'2025-02-10');
INSERT INTO Registration VALUES(7,7,4,'2025-02-10');
INSERT INTO Registration VALUES(8,8,5,'2025-02-11');
INSERT INTO Registration VALUES(9,9,5,'2025-02-11');
INSERT INTO Registration VALUES(10,10,6,'2025-02-12');
INSERT INTO Registration VALUES(11,11,7,'2025-01-05');
INSERT INTO Registration VALUES(12,12,7,'2025-01-06');
INSERT INTO Registration VALUES(13,13,8,'2025-01-07');
INSERT INTO Registration VALUES(14,14,9,'2025-03-20');
INSERT INTO Registration VALUES(15,15,10,'2025-03-21');
INSERT INTO Registration VALUES(16,1,11,'2025-03-01');
INSERT INTO Registration VALUES(17,3,12,'2025-03-02');
INSERT INTO Registration VALUES(18,5,4,'2025-02-12');
INSERT INTO Registration VALUES(19,2,8,'2025-01-08');
INSERT INTO Registration VALUES(20,7,11,'2025-03-03');
INSERT INTO Registration VALUES(21,9,15,'2025-02-05');
INSERT INTO Registration VALUES(22,12,15,'2025-02-05');
INSERT INTO Registration VALUES(23,16,13,'2025-02-10');
INSERT INTO Registration VALUES(24,17,13,'2025-02-10');
INSERT INTO Registration VALUES(25,18,14,'2025-02-11');
INSERT INTO Registration VALUES(26,19,2,'2025-02-06');
INSERT INTO Registration VALUES(27,20,9,'2025-03-22');
INSERT INTO Registration VALUES(28,6,11,'2025-03-04');
INSERT INTO Registration VALUES(29,8,10,'2025-03-23');
INSERT INTO Registration VALUES(30,10,7,'2025-01-09');

-- Volunteer
INSERT INTO Volunteer VALUES(1,'Neel Shah','9710001111','Stage Manager');
INSERT INTO Volunteer VALUES(2,'Isha Patel','9720002222','Registration Desk');
INSERT INTO Volunteer VALUES(3,'Parth Mehta','9730003333','Security');
INSERT INTO Volunteer VALUES(4,'Ritu Sharma','9740004444','Photography');
INSERT INTO Volunteer VALUES(5,'Dhruv Joshi','9750005555','Logistics');
INSERT INTO Volunteer VALUES(6,'Kavya Desai','9760006666','Event Coordinator');
INSERT INTO Volunteer VALUES(7,'Manan Trivedi','9770007777','Technical Support');
INSERT INTO Volunteer VALUES(8,'Shreya Rao','9780008888','Hospitality');
INSERT INTO Volunteer VALUES(9,'Aditya Kumar','9790009999','Crowd Management');
INSERT INTO Volunteer VALUES(10,'Puja Singh','9700001010','First Aid');

-- Volunteer_Assignment
INSERT INTO Volunteer_Assignment VALUES(1,1,1);
INSERT INTO Volunteer_Assignment VALUES(2,2,1);
INSERT INTO Volunteer_Assignment VALUES(3,3,2);
INSERT INTO Volunteer_Assignment VALUES(4,4,2);
INSERT INTO Volunteer_Assignment VALUES(5,5,3);
INSERT INTO Volunteer_Assignment VALUES(6,6,4);
INSERT INTO Volunteer_Assignment VALUES(7,7,4);
INSERT INTO Volunteer_Assignment VALUES(8,8,5);
INSERT INTO Volunteer_Assignment VALUES(9,9,5);
INSERT INTO Volunteer_Assignment VALUES(10,1,6);
INSERT INTO Volunteer_Assignment VALUES(11,2,7);
INSERT INTO Volunteer_Assignment VALUES(12,3,8);
INSERT INTO Volunteer_Assignment VALUES(13,4,9);
INSERT INTO Volunteer_Assignment VALUES(14,5,10);
INSERT INTO Volunteer_Assignment VALUES(15,6,11);
INSERT INTO Volunteer_Assignment VALUES(16,7,12);
INSERT INTO Volunteer_Assignment VALUES(17,8,13);
INSERT INTO Volunteer_Assignment VALUES(18,9,14);
INSERT INTO Volunteer_Assignment VALUES(19,10,15);
INSERT INTO Volunteer_Assignment VALUES(20,1,15);

-- Sponsor
INSERT INTO Sponsor VALUES(1,'Ramesh Gupta','TechCorp Pvt Ltd','9610001111','ramesh@techcorp.in',50000.00,1);
INSERT INTO Sponsor VALUES(2,'Lata Verma','MediaWorld Inc','9620002222','lata@mediaworld.in',30000.00,2);
INSERT INTO Sponsor VALUES(3,'Sunil Kapoor','FoodieHub','9630003333','sunil@foodiehub.in',20000.00,3);
INSERT INTO Sponsor VALUES(4,'Neeta Singh','EduTech Solutions','9640004444','neeta@edutech.in',45000.00,4);
INSERT INTO Sponsor VALUES(5,'Amit Trivedi','AutoMotive Parts Ltd','9650005555','amit@automotive.in',35000.00,5);
INSERT INTO Sponsor VALUES(6,'Prerna Jain','GreenEnergy Co.','9660006666','prerna@greenenergy.in',25000.00,1);
INSERT INTO Sponsor VALUES(7,'Varun Malhotra','StyleFashion House','9670007777','varun@stylefashion.in',40000.00,2);
INSERT INTO Sponsor VALUES(8,'Kavita Nair','HealthPlus','9680008888','kavita@healthplus.in',15000.00,3);
INSERT INTO Sponsor VALUES(9,'Rajesh Bose','InfraWorld','9690009999','rajesh@infraworld.in',60000.00,4);
INSERT INTO Sponsor VALUES(10,'Smita Doshi','CloudTech India','9600001010','smita@cloudtech.in',55000.00,5);

-- Ticket
INSERT INTO Ticket VALUES(1,150.00,1);
INSERT INTO Ticket VALUES(2,100.00,2);
INSERT INTO Ticket VALUES(3,50.00,3);
INSERT INTO Ticket VALUES(4,200.00,4);
INSERT INTO Ticket VALUES(5,250.00,5);
INSERT INTO Ticket VALUES(6,0.00,6);
INSERT INTO Ticket VALUES(7,80.00,7);
INSERT INTO Ticket VALUES(8,60.00,8);
INSERT INTO Ticket VALUES(9,120.00,9);
INSERT INTO Ticket VALUES(10,30.00,10);
INSERT INTO Ticket VALUES(11,180.00,11);
INSERT INTO Ticket VALUES(12,40.00,12);
INSERT INTO Ticket VALUES(13,70.00,13);
INSERT INTO Ticket VALUES(14,50.00,14);
INSERT INTO Ticket VALUES(15,300.00,15);

-- Payment
INSERT INTO Payment VALUES(1,150.00,'2025-02-01','Completed',1,1);
INSERT INTO Payment VALUES(2,150.00,'2025-02-02','Completed',2,1);
INSERT INTO Payment VALUES(3,100.00,'2025-02-03','Completed',3,2);
INSERT INTO Payment VALUES(4,100.00,'2025-02-03','Completed',4,2);
INSERT INTO Payment VALUES(5,50.00,'2025-02-04','Completed',5,3);
INSERT INTO Payment VALUES(6,200.00,'2025-02-10','Completed',6,4);
INSERT INTO Payment VALUES(7,200.00,'2025-02-10','Pending',7,4);
INSERT INTO Payment VALUES(8,250.00,'2025-02-11','Completed',8,5);
INSERT INTO Payment VALUES(9,250.00,'2025-02-11','Completed',9,5);
INSERT INTO Payment VALUES(10,0.00,'2025-02-12','Completed',10,6);
INSERT INTO Payment VALUES(11,80.00,'2025-01-05','Completed',11,7);
INSERT INTO Payment VALUES(12,80.00,'2025-01-06','Completed',12,7);
INSERT INTO Payment VALUES(13,60.00,'2025-01-07','Completed',13,8);
INSERT INTO Payment VALUES(14,120.00,'2025-03-20','Completed',14,9);
INSERT INTO Payment VALUES(15,30.00,'2025-03-21','Failed',15,10);
INSERT INTO Payment VALUES(16,180.00,'2025-03-01','Completed',1,11);
INSERT INTO Payment VALUES(17,40.00,'2025-03-02','Completed',3,12);
INSERT INTO Payment VALUES(18,200.00,'2025-02-12','Completed',5,4);
INSERT INTO Payment VALUES(19,60.00,'2025-01-08','Pending',2,8);
INSERT INTO Payment VALUES(20,180.00,'2025-03-03','Completed',7,11);
INSERT INTO Payment VALUES(21,300.00,'2025-02-05','Completed',9,15);
INSERT INTO Payment VALUES(22,300.00,'2025-02-05','Completed',12,15);
INSERT INTO Payment VALUES(23,70.00,'2025-02-10','Completed',16,13);
INSERT INTO Payment VALUES(24,70.00,'2025-02-10','Completed',17,13);
INSERT INTO Payment VALUES(25,50.00,'2025-02-11','Refunded',18,14);
INSERT INTO Payment VALUES(26,100.00,'2025-02-06','Completed',19,2);
INSERT INTO Payment VALUES(27,120.00,'2025-03-22','Completed',20,9);
INSERT INTO Payment VALUES(28,180.00,'2025-03-04','Completed',6,11);
INSERT INTO Payment VALUES(29,30.00,'2025-03-23','Failed',8,10);
INSERT INTO Payment VALUES(30,80.00,'2025-01-09','Completed',10,7);

-- Stall
INSERT INTO Stall VALUES(1,'Tadka Dhaba','Food','9510001111','Ramesh Bhai',1);
INSERT INTO Stall VALUES(2,'Chill Zone','Beverages','9520002222','Suresh Kumar',1);
INSERT INTO Stall VALUES(3,'Tech Gadgets','Electronics','9530003333','Priya Stores',2);
INSERT INTO Stall VALUES(4,'Book Nook','Stationery','9540004444','Rajesh Books',2);
INSERT INTO Stall VALUES(5,'Ethnic Wear Hub','Clothing','9550005555','Meena Fashions',3);
INSERT INTO Stall VALUES(6,'Funky Accessories','Accessories','9560006666','Deepa Traders',3);
INSERT INTO Stall VALUES(7,'Fast Bites','Food','9570007777','Quick Eats Co.',4);
INSERT INTO Stall VALUES(8,'Game Zone','Games','9580008888','Fun World',4);
INSERT INTO Stall VALUES(9,'Artistic Corner','Art and Craft','9590009999','Chirag Arts',5);
INSERT INTO Stall VALUES(10,'Spice Garden','Food','9500001010','Anita Foods',5);
INSERT INTO Stall VALUES(11,'Sports Corner','Sports Equipment','9511001111','SportZone',6);
INSERT INTO Stall VALUES(12,'Health Bar','Food','9522002222','NutriLife',6);
INSERT INTO Stall VALUES(13,'Snack Attack','Food','9533003333','Bhavesh Snacks',1);
INSERT INTO Stall VALUES(14,'Digital Print','Services','9544004444','PrintFast',2);

-- Merchandise
INSERT INTO Merchandise VALUES(1,'Nirmaitsav T-Shirt',299.00,200,1);
INSERT INTO Merchandise VALUES(2,'Nirmaitsav Hoodie',599.00,100,1);
INSERT INTO Merchandise VALUES(3,'Nirmaitsav Cap',149.00,150,1);
INSERT INTO Merchandise VALUES(4,'TechFest T-Shirt',249.00,180,2);
INSERT INTO Merchandise VALUES(5,'TechFest Pen Drive 16GB',399.00,80,2);
INSERT INTO Merchandise VALUES(6,'TechFest Notebook',99.00,200,2);
INSERT INTO Merchandise VALUES(7,'iCultura Tote Bag',199.00,120,3);
INSERT INTO Merchandise VALUES(8,'iCultura Wristband',49.00,300,3);
INSERT INTO Merchandise VALUES(9,'Synergy Hoodie',549.00,90,4);
INSERT INTO Merchandise VALUES(10,'Synergy Keychain',79.00,250,4);
INSERT INTO Merchandise VALUES(11,'Aaveg T-Shirt',279.00,160,5);
INSERT INTO Merchandise VALUES(12,'Aaveg Poster',59.00,200,5);
INSERT INTO Merchandise VALUES(13,'SportzMania Jersey',349.00,75,6);
INSERT INTO Merchandise VALUES(14,'SportzMania Water Bottle',149.00,120,6);
INSERT INTO Merchandise VALUES(15,'Nirmaitsav Wristband',49.00,400,1);

-- ============================================================
-- END OF INSERT SCRIPTS
-- ============================================================
