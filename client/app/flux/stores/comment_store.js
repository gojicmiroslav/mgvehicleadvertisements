import Constants from '../constants';
import AppDispatcher from '../dispatcher';
import {EventEmitter} from 'events';

class CommentStore extends EventEmitter {
	constructor(){
		super();
		this._comments = [];

		AppDispatcher.register((payload) => {
		 	var action = payload.actionType;
			switch(action){
				case Constants.ADD_COMMENT:
					this.addComment(payload.comment);
					this.emitChange();
					break;
				case Constants.SET_COMMENTS:
					this.setComments(payload.comments);
					this.emitChange();
					break;
				case Constants.UPVOTE_COMMENT:
					this.upvote(payload.comment);
					this.emitChange();
					break;
				default:
					// NO-OP
			}
		});
	}

 	addComment(comment){
 		this._comments[comment.id || this._comments.length] = comment;
 	}

 	setComments(comments){
 		for(var i in comments){
 			this.addComment(comments[i]);
 		}
 	}

 	comments(parentId){
		//return only children comments for given parentId
 	 	return this._comments.filter(c => {
	 		return c && c.parent_id == parentId;
		});
 	}

 	upvote(comment){
 		this._comments[comment.id].rank++;
 	}

 	addChangeListener(callback){
 		this.on(Constants.CHANGE_EVENT, callback);
 	}

 	removeChangeListener(callback){
 		this.removeListener(Constants.CHANGE_EVENT, callback);
 	}

 	emitChange(){
 		this.emit(Constants.CHANGE_EVENT);
 	}
}

export default CommentStore;
