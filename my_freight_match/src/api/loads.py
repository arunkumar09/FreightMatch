from flask import Blueprint, jsonify, request, abort
from ..models import db, Load

bp = Blueprint('loads', __name__, url_prefix='/loads')

@bp.route('', methods=['GET'])
def index():
    tweets = Load.query.all() # ORM performs SELECT query
    result = []
    for t in tweets:
        result.append(t.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id):
    t = Load.query.get_or_404(id)
    return jsonify(t.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'user_id' not in request.json or 'content' not in request.json:
        return abort(400)
    # user with id of user_id must exist
    User.query.get_or_404(request.json['user_id'])
    # construct Tweet
    t = Load(
        user_id=request.json['user_id'],
        content=request.json['content']
    )
    db.session.add(t) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(t.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id:int):
    t = TweetLoad.query.get_or_404(id)
    try:
        db.session.delete(t) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
    