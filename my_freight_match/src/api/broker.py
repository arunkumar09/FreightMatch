from flask import Blueprint, jsonify, request, abort
from ..models import db, Broker, Load, Location

bp = Blueprint('broker', __name__, url_prefix='/brokers')

@bp.route('', methods=['GET'])
def allBrokers():
    brokers = Broker.query.all() # ORM performs SELECT query
    result = []
    for b in brokers:
        result.append(b.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:broker_id>', methods=['GET'])
def showBroker(broker_id:int):
    b = Broker.query.get_or_404(broker_id)
    return jsonify(b.serialize())

@bp.route('', methods=['POST'])
def createBroker():
    if 'name' not in request.json or 'company_name' not in request.json or 'email' not in request.json or 'dot_number' not in request.json or 'phone' not in request.json or 'created_at' not in request.json:
        return abort(400, "Missing required fields")
   # construct Broker
    if len(request.json['name']) > 100 or len(request.json['company_name']) > 100 or len(request.json['email']) > 100 or len(request.json['phone']) > 100:
        return abort(400)
    b = Broker(
        name =request.json['name'],
        company_name =request.json['company_name'],
        email =request.json['email'],
        dot_number =request.json['dot_number'],
        phone =request.json['phone'],
        created_at =request.json['created_at']
    )
    db.session.add(t) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(t.serialize())

@bp.route('/<int:broker_id>', methods=['DELETE'])
def deleteBroker(broker_id:int):
    b = Broker.query.get_or_404(id)
    try:
        db.session.delete(b) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:broker_id>', methods=['PATCH', 'PUT'])
def update(broker_id:int):
    b = Broker.query.get_or_404(id)
    if 'username' in request.json:
        if len(request.json['username']) < 3:
            return abort(400)
        u.username = request.json['username']
    if 'password' in request.json:
        if len(request.json['password']) < 8:
            return abort(400)
        u.password = scramble(request.json['password'])
    try:
        db.session.commit() # execute UPDATE statement
        return jsonify(u.serialize())
    except:
        return abort(400)