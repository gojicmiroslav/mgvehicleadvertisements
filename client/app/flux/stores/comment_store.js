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
				default:
					// NO-OP
			}
		});
	}
 
 	addComment(comment){
 		this._comments[comment.id] = comment;
 		console.log(this._comments);
 	}
 
 	comments(){
 		return this._comments;
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