# Freight Match API

## Description
The Freight Match API is a backend service designed to connect brokers and carriers in a public freight loadboard system.  
It allows brokers to post loads, carriers to search and book them, and provides CRUD operations. 

This project uses Python, Flask, and SQLAlchemy ORM.

---

# API Reference

| Entity | Endpoint Path | Method | Description | Parameters (Body / Query) |
|:-------|:--------------|:-------|:-------------|:--------------------------|
| **Brokers** | `/api/brokers` | `GET` | Get all brokers | — |
|  | `/api/brokers/{broker_id}` | `GET` | Get broker by ID | `broker_id` |
|  | `/api/brokers` | `POST` | Create a new broker | `name`, `company_name`, `email`, `phone`, `dot_number` |
|  | `/api/brokers/{broker_id}` | `PUT` | Update broker info | `broker_id`, updated fields |
|  | `/api/brokers/{broker_id}` | `DELETE` | Delete broker | `broker_id` |
| **Carriers** | `/api/carriers` | `GET` | Get all carriers | — |
|  | `/api/carriers/{carrier_id}` | `GET` | Get carrier by ID | `carrier_id` |
|  | `/api/carriers` | `POST` | Create a new carrier | `name`, `company_name`, `email`, `mc_number`, `equipment_type` |
|  | `/api/carriers/{carrier_id}` | `PUT` | Update carrier info | updated fields |
|  | `/api/carriers/{carrier_id}` | `DELETE` | Delete carrier | `carrier_id` |
| **Locations** | `/api/locations` | `GET` | Get all locations | — |
|  | `/api/locations/{location_id}` | `GET` | Get location by ID | `location_id` |
|  | `/api/locations` | `POST` | Create a new location | `city`, `state`, `country`, `zip_code`, `latitude`, `longitude` |
|  | `/api/locations/{location_id}` | `PUT` | Update location | updated fields |
|  | `/api/locations/{location_id}` | `DELETE` | Delete location | `location_id` |
| **Loads** | `/api/loads` | `GET` | Get all loads | filters: `origin`, `destination`, `status` |
|  | `/api/loads/{load_id}` | `GET` | Get load by ID | `load_id` |
|  | `/api/loads` | `POST` | Post a new load | `broker_id`, `origin_id`, `destination_id`, `pickup_date`, `delivery_date`, `rate`, `equipment_required` |
|  | `/api/loads/{load_id}` | `PUT` | Update load | updated fields |
|  | `/api/loads/{load_id}` | `DELETE` | Delete load | `load_id` |
| **Bookings** | `/api/bookings` | `GET` | Get all bookings | — |
|  | `/api/bookings/{booking_id}` | `GET` | Get booking by ID | `booking_id` |
|  | `/api/bookings` | `POST` | Create a booking | `load_id`, `carrier_id`, `booking_date` |
|  | `/api/bookings/{booking_id}` | `PUT` | Update booking | `status`, `booking_date` |
|  | `/api/bookings/{booking_id}` | `DELETE` | Cancel booking | `booking_id` |

---

## This is implemented using an ORM mostly because I wanted practice using that framework, also I did not want to write SQL queries manually.
