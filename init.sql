-- Creating the database
CREATE DATABASE IF NOT EXISTS warframe;

-- Creating user and granting privileges
CREATE USER IF NOT EXISTS 'warframe_user'@'localhost' IDENTIFIED BY 'secure_password_123';
GRANT SELECT, INSERT, UPDATE, DELETE ON warframe.* TO 'warframe_user'@'localhost';

-- Using the database
USE warframe;

-- Creating the items table
CREATE TABLE IF NOT EXISTS items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Creating the relics table with foreign keys
CREATE TABLE IF NOT EXISTS relics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    common1 INT,
    common2 INT,
    common3 INT,
    uncommon1 INT,
    uncommon2 INT,
    rare INT,
    FOREIGN KEY (common1) REFERENCES items(id),
    FOREIGN KEY (common2) REFERENCES items(id),
    FOREIGN KEY (common3) REFERENCES items(id),
    FOREIGN KEY (uncommon1) REFERENCES items(id),
    FOREIGN KEY (uncommon2) REFERENCES items(id),
    FOREIGN KEY (rare) REFERENCES items(id)
);

-- Inserting testing data into items
INSERT INTO items (name, description) VALUES
('Braton Prime Barrel', 'A component for the Braton Prime weapon.'),
('Braton Prime Receiver', 'A component for the Braton Prime weapon.'),
('Braton Prime Stock', 'A component for the Braton Prime weapon.'),
('Forma', 'Used to polarize Warframe and weapon slots.'),
('Orokin Cell', 'A rare resource used in crafting.'),
('Paris Prime String', 'A component for the Paris Prime weapon.'),
('Paris Prime Grip', 'A component for the Paris Prime weapon.'),
('Paris Prime Upper Limb', 'A component for the Paris Prime weapon.'),
('Paris Prime Lower Limb', 'A component for the Paris Prime weapon.'),
('Control Module', 'A rare resource used in advanced crafting.');

-- Inserting testing data into relics (using item IDs from above)
INSERT INTO relics (name, common1, common2, common3, uncommon1, uncommon2, rare) VALUES
('Lith B1', 1, 2, 3, 4, 5, 6),
('Meso P1', 7, 8, 9, 10, 1, 2),
('Neo B3', 3, 4, 5, 6, 7, 8);
