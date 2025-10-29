import datetime
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()
class Broker(db.Model):
    __tablename__ = 'brokers'
    broker_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    company_name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    phone = db.Column(db.String(15), nullable=True)
    dot_number = db.Column(db.String(20), nullable=False, unique=True)
    created_at = db.Column(
        db.DateTime,
        default=datetime.datetime.utcnow,
        nullable=False)
    def __init__(self, name:str, company_name:str, email:str, phone:str=None, dot_number:str=None, created_at:datetime.datetime=None):
        self.name = name
        self.company_name = company_name
        self.email = email
        self.phone= phone
        self.dot_number = dot_number
        if created_at:
            self.created_at = created_at
    def serialize(self):
        return {
            'broker_id': self.broker_id,
            'name': self.name,
            'company_name': self.company_name,
            'email': self.email,
            'phone': self.phone,
            'dot_number': self.dot_number,
            'created_at': self.created_at.isoformat(),
        }

class Location(db.Model):
    __tablename__ = 'locations'
    location_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    city = db.Column(db.String(100), nullable=True)
    state = db.Column(db.String(100), nullable=False)
    zip_code = db.Column(db.String(20), nullable=False)
    country = db.Column(db.String(100), nullable=True)
    lattitude = db.Column(db.Float(9,6), nullable=True)
    longitude = db.Column(db.Float(9,6), nullable=True)
    

    def __init__(self, city:str=None, state:str=None, zip_code:str=None , country:str=None, lattitude:float=None, longitude:float=None):
        self.city = city
        self.state = state
        self.zip_code = zip_code
        self.country = country
        self.lattitude = lattitude
        self.longitude = longitude
    def serialize(self):
        return {
            'location_id': self.location_id,
            'city': self.city,
            'state': self.state,
            'zip_code': self.zip_code,
            'country': self.country,
            'lattitude': self.lattitude,
            'longitude': self.longitude,
        }

class Load(db.Model):
    __tablename__ = 'loads'
    load_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pickup_date = db.Column(db.DateTime, default=False, nullable=False)
    delivery_date = db.Column(db.DateTime, default=False, nullable=False)
    rate = db.Column(db.Float(10,2), nullable=False)
    weight = db.Column(db.Integer, nullable=False)
    equipment = db.Column(db.String(50), nullable=False)
    broker_id = db.Column(db.Integer, db.ForeignKey('brokers.broker_id'), nullable=False)
    origin_id = db.Column(db.Integer, db.ForeignKey('locations.location_id'), nullable=False)
    destination_id = db.Column(db.Integer, db.ForeignKey('locations.location_id'), nullable=False)
    created_at = db.Column(
        db.DateTime,
        default=datetime.datetime.utcnow,
        nullable=False)
    def __init__(self, broker_id:int, origin_id:int, destination_id:int, weight:float, equipment:str, rate:float, pickup_date:datetime.datetime, delivery_date:datetime.datetime):
        self.broker_id = broker_id
        self.origin_id = origin_id
        self.destination_id = destination_id
        self.weight = weight
        self.equipment = equipment
        self.rate = rate
        self.pickup_date = pickup_date
        self.delivery_date = delivery_date
    def serialize(self):
        return {
            'load_id': self.load_id,
            'broker_id': self.broker_id,
            'origin_id': self.origin_id,
            'destination_id': self.destination_id,
            'weight': self.weight,
            'equipment': self.equipment,
            'created_at': self.created_at.isoformat(),
            'rate': self.rate,
            'pickup_date': self.pickup_date.isoformat(),
            'delivery_date': self.delivery_date.isoformat(),
        }

class Carrier(db.Model):
    __tablename__ = 'carriers'
    carrier_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    company_name = db.Column(db.String(100), nullable=False)
    mc_number = db.Column(db.String(20), nullable=False, unique=True)
    email = db.Column(db.String(100), nullable=False, unique=True)
    phone = db.Column(db.String(15), nullable=True)
    created_at = db.Column(
        db.DateTime,
        default=datetime.datetime.utcnow,
        nullable=False)
    def __init__(self, name:str, mc_number:str, email:str, phone_:str=None, company_name:str=None):
        self.name = name
        self.mc_number = mc_number
        self.email = email
        self.phone= phone
        self.company_name = company_name
    def serialize(self):
        return {
            'carrier_id': self.carrier_id,
            'name': self.name,
            'mc_number': self.mc_number,
            'email': self.email,
            'phone': self.phone,
            'created_at': self.created_at.isoformat(),
            'company_name': self.company_name,
        }

class Booking(db.Model):
    __tablename__ = 'bookings'
    booking_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    load_id = db.Column(db.Integer, db.ForeignKey('loads.load_id'), nullable=False)
    carrier_id = db.Column(db.Integer, db.ForeignKey('carriers.carrier_id'), nullable=False)
    status = db.Column(db.String(50), nullable=False, default='PENDING')
    booked_date = db.Column(
        db.DateTime,
        default=datetime.datetime.utcnow,
        nullable=False)
    def __init__(self, load_id:int, carrier_id:int, status:str='PENDING', booked_date:datetime.datetime=None):
        self.load_id = load_id
        self.carrier_id = carrier_id
        self.status = status
        if booked_date:
            self.booked_date = booked_date
    def serialize(self):
        return {
            'booking_id': self.booking_id,
            'load_id': self.load_id,
            'carrier_id': self.carrier_id,
            'booked_date': self.booked_date.isoformat(),
            'status': self.status,
        }