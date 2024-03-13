-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the AGPL-3.0, check LICENSE for more details.

-- 0.misc.sql

INSERT INTO locale (id, name) VALUES
(1, 'English'),
(2, 'Hindi');

-- 1.catalogue.sql
INSERT INTO catalogue_type (id, name, parent) VALUES
(1, 'category', 1),
(2, 'subject', 2),
(3, 'chapter', 3),
(4, 'topic', 4),
(5, 'sub-topic', 5),
(6, 'course', 6);

INSERT INTO catalogue (id, type, name, parent) VALUES
-- Categories
(1, 1, 'Class 6', 1),
(2, 1, 'Class 7', 2),
(3, 1, 'Class 8', 3),
(4, 1, 'Class 9', 4),
(5, 1, 'Class 10', 5),
(6, 1, 'Commerce', 6),
(7, 1, 'Engineering', 7),
(8, 1, 'Medical', 8),
-- Courses
(9, 6, 'Mathematics Class 10', 9),
(10, 6, 'Science Class 10', 10),
(11, 6, 'English Class 10', 11),
(12, 6, 'Social Science Class 10', 12),
(13, 6, 'Hindi Class 10', 13),
(14, 6, 'Physics Class 10', 14),
(15, 6, 'Chemistry Class 10', 15),
(16, 6, 'Biology Class 10', 16),
(17, 6, 'Computer Science Class 10', 17),
(18, 6, 'Economics Class 10', 18),
(19, 6, 'Geography Class 10', 19),
(20, 6, 'History Class 10', 20),
(21, 6, 'Civics Class 10', 21),
(22, 6, 'Mathematics Practice Class 10', 22),
(23, 6, 'Science Practice Class 10', 23),
(24, 6, 'English Practice Class 10', 24),
(25, 6, 'Social Science Practice Class 10', 25),
(26, 6, 'Hindi Practice Class 10', 26),
(27, 6, 'Physics Practice Class 10', 27),
(28, 6, 'Chemistry Practice Class 10', 28),
(29, 6, 'Biology Practice Class 10', 29),
(30, 6, 'Computer Science Practice Class 10', 30),
(31, 6, 'Economics Practice Class 10', 31),
(32, 6, 'Geography Practice Class 10', 32),
(33, 6, 'History Practice Class 10', 33),
-- Subjects for Class 10
(34, 2, 'Maths', 5),
(35, 2, 'Science', 5),
(36, 2, 'History', 5),
(37, 2, 'Geography', 5),
(38, 2, 'Political Science', 5),
(39, 2, 'Economics', 5),
(40, 2, 'English', 5),
(41, 2, 'Hindi', 5),
-- Maths Chapters
(42, 3, 'Real Numbers', 9),
(43, 3, 'Polynomials', 9),
(44, 3, 'Pair of Linear Equations in Two Variables', 9),
(45, 3, 'Quadratic Equations', 9),
(46, 3, 'Arithmetic Progressions', 9),
(47, 3, 'Triangles', 9),
(48, 3, 'Coordinate Geometry', 9),
(49, 3, 'Introduction to Trigonometry', 9),
(50, 3, 'Some Applications of Trigonometry', 9),
(51, 3, 'Circles', 9),
(52, 3, 'Areas Related to Circles', 9),
(53, 3, 'Surface Areas and Volumes', 9),
(54, 3, 'Statistics', 9),
(55, 3, 'Probability', 9),
-- Science Chapters
(56, 3, 'Chemical reactions and equations', 10),
(57, 3, 'Acids, Bases and Salt', 10),
(58, 3, 'Metals and Non-metals', 10),
(59, 3, 'Carbon and Its Compounds', 10),
(60, 3, 'Life Processes', 10),
(61, 3, 'Control and Coordination', 10),
(62, 3, 'How Do Organisms Reproduce?', 10),
(63, 3, 'Heredity and Evolution', 10),
(64, 3, 'Light Reflection and Refraction', 10),
(65, 3, 'The Human Eye and Colourful World', 10),
(66, 3, 'Electricity', 10),
(67, 3, 'Magnetic Effects of Electric Current', 10),
(68, 3, 'Our Environment', 10),
-- History Chapters
(69, 3, 'The Rise of Nationalism in Europe', 11),
(70, 3, 'Nationalism in India', 11),
(71, 3, 'The Making of a Global World', 11),
(72, 3, 'The Age of Industrialisation', 11),
(73, 3, 'Print Culture and the Modern World', 11),
-- Geography Chapters
(74, 3, 'Resources and Development', 12),
(75, 3, 'Forest and Wildlife Resources', 12),
(76, 3, 'Water Resources', 12),
(77, 3, 'Agriculture ', 12),
(78, 3, 'Minerals and Energy Resources', 12),
(79, 3, 'Manufacturing Industries', 12),
(80, 3, 'Lifelines of National Economy', 12),
-- Polity Chapters
(81, 3, 'Power-sharing', 13),
(82, 3, 'Federalism', 13),
(83, 3, 'Gender, Religion and Caste', 13),
(84, 3, 'Political Parties', 13),
(85, 3, 'Outcomes of Democracy', 13),
-- Economics Chapters
(86, 3, 'Development', 14),
(87, 3, 'Sectors of the Indian Economy', 14),
(88, 3, 'Money and Credit', 14),
(89, 3, 'Globalisation and the Indian Economy', 14),
(90, 3, 'Consumer Rights', 14);


INSERT INTO document
(id, name, is_public, c_ids, locale, content, created_at, updated_at)
VALUES
(10101, 'course description', true, null, 1, '## This is a sample description', 1708003600, 1708003600);

-- 1.catalogue.sql
INSERT INTO course 
(id, cid, name, locale, validity, price, discount_percent, is_public, is_open, description, thumbnail, starts_at, ends_at, created_at, updated_at) 
VALUES
(9, 'C1', 'Mathematics Class 10', 1, 365, 5000, 10, true, true, 10101, 'math_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(10, 'N2', 'Science Class 10', 1, null, 4500, 15, false, false, 10101, 'science_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(11, 'C3', 'English Class 10', 1, 36, 4000, 20, true, true, 10101, 'english_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(12, 'N4', 'Social Science Class 10', 1, 365, 4800, 12, true, true, 10101, 'social_science_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(13, 'C5', 'Hindi Class 10', 1, 36, 3500, 18, false, false, 10101, 'hindi_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(14, 'N06', 'Physics Class 10', 1, 35, 4200, 14, true, true, 10101, 'physics_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(15, 'C07', 'Chemistry Class 10', 1, 35, 4300, 16, true, true, 10101, 'chemistry_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(16, 'N08', 'Biology Class 10', 1, 6, 4100, 11, true, true, 10101, 'biology_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(17, 'C09', 'Computer Science Class 10', 1, 36, 3800, 9, true, true, 10101, 'computer_science_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(18, 'N10', 'Economics Class 10', 1, 65, 4600, 13, true, true, 10101, 'economics_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(19, 'C11', 'Geography Class 10', 1, 30, 4400, 17, true, true, 10101, 'geography_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(20, 'N12', 'History Class 10', 1, 65, 4700, 15, true, true, 10101, 'history_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(21, 'C13', 'Civics Class 10', 1, 65, 3900, 12, true, true, 10101, 'civics_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(22, 'N14', 'Mathematics Practice Class 10', 1, 36, 3200, 8, true, true, 10101, 'math_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(23, 'C15', 'Science Practice Class 10', 1, 25, 3300, 10, false, false, 10101, 'science_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(24, 'N16', 'English Practice Class 10', 1, 125, 3100, 14, true, true, 10101, 'english_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(25, 'C17', 'Social Science Practice Class 10', 1, 156, 3400, 9, true, true, 10101, 'social_science_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(26, 'N18', 'Hindi Practice Class 10', 1, null, 3000, 11, false, false, 10101, 'hindi_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(27, 'C19', 'Physics Practice Class 10', 1, 100, 3200, 13, true, true, 10101, 'physics_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(28, 'N20', 'Chemistry Practice Class 10', 1, 65, 3300, 15, true, true, 10101, 'chemistry_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(29, 'C21', 'Biology Practice Class 10', 1, 30, 3100, 10, true, true, 10101, 'biology_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(30, 'N22', 'Computer Science Practice Class 10', 1, 365, 3200, 12, true, true, 10101, 'computer_science_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(31, 'C23', 'Economics Practice Class 10', 1, 50, 3400, 8, false, false, 10101, 'economics_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(32, 'N24', 'Geography Practice Class 10', 1, null, 3500, 11, true, true, 10101, 'geography_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200),
(33, 'C25', 'History Practice Class 10', 1, 28, 3300, 13, true, true, 10101, 'history_practice_class_10.jpg', 1676467600, 1708003600, 1644889200, 1644889200);
