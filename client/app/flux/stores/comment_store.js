import Constants from '../constants';
import AppDispatcher from '../dispatcher';
import {EventEmitter} from 'events';
import _ from 'lodash';

var CommentStore = new _.extend({}, EventEmitter.prototype, {
 	_comments: [],
 
 	addComment: function(comment){
 		this._comments[comment.id] = comment;
 	},
 
 	comments: function(){
 		return this._comments;
 	},
 
 	addChangeListener: function(callback){
 		this.on(Constants.CHANGE_EVENT, callback);
 	},
 
 	removeChangeListener: function(callback){
 		this.removeListener(Constants.CHANGE_EVENT, callback);
 	},
 
 	emitChange: function(){
 		this.emit(Constants.CHANGE_EVENT);
 	}
 });

window.Store = CommentStore;
export default CommentStore;