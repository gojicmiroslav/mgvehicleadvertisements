// var AppDispatcher = new Flux.Dispatcher();

// // register(callback)
// AppDispatcher.register(function(payload){
// 	var action = payload.actionType;

// 	switch(action){
// 		case Constants.ADD_COMMENT:
// 			Store.addComment(payload.comment);
// 			Store.emitChange();
// 			break;
// 		default:
// 			// NO-OP
// 	}
// });

import {Dispatcher} from 'flux';
import CommentStore from './stores/comment_store';
import Constants from './constants';

var AppDispatcher = new Dispatcher();

AppDispatcher.register((payload) => {
 	var action = payload.actionType;
	switch(action){
		case Constants.ADD_COMMENT:
			CommentStore.addComment(payload.comment);
			CommentStore.emitChange();
			break;
		default:
			// NO-OP
	}
});

window.AppDispatcher = AppDispatcher;
export default AppDispatcher;