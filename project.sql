-- 🧭 Relationships Summary
-- Relationship	Type	Description
-- Broker → Load	1 → M	Broker can post many loads
-- Load → Location (origin)	M → 1	Each load has one origin location
-- Load → Location (destination)	M → 1	Each load has one destination location
-- Carrier → Booking	1 → M	Carrier can make many bookings
-- Load → Booking	1 → 1 or 1 → M	Load can be booked once or multiple times
-- Broker: 
-- broker_id
-- name
-- company_name
-- email
-- phone
-- dot_number
-- created_at

CREATE TABLE brokers (
    broker_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    dot_number VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Location:
-- location_id
-- city
-- state
-- country
-- zip_code
-- latitude
-- longitude
CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    country VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);
-- Load:
-- load_id
-- pickup_date
-- delivery_date
-- weight
-- equipment
-- rate
-- created_at
-- broker_id(fk_Broker.broker_id)
-- origin_id (fk_Location.location_id)
-- destination_id (fk_Location.location_id)
CREATE TABLE loads (
    load_id SERIAL PRIMARY KEY,
    pickup_date DATE NOT NULL,
    delivery_date DATE NOT NULL,
    weight INTEGER NOT NULL,
    equipment VARCHAR(50) NOT NULL,
    rate DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    broker_id INTEGER REFERENCES brokers(broker_id),
    origin_id INTEGER REFERENCES locations(location_id),
    destination_id INTEGER REFERENCES locations(location_id)
);
-- Carrier:
-- carrier_id
-- name
-- company_name
-- email
-- phone
-- mc_number
-- equipment
-- created_at

CREATE TABLE carriers (
    carrier_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    mc_number VARCHAR(20) UNIQUE NOT NULL,
    equipment VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Booking:
-- booking_id
-- booking_date
-- status

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    load_id INTEGER REFERENCES loads(load_id),
    carrier_id INTEGER REFERENCES carriers(carrier_id)
);