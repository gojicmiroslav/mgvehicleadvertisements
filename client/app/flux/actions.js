import Constants from './constants';
import AppDispatcher from './dispatcher';
import Api from './../lib/api';

class Actions {
	static addComment(params){
		Api.post('/advertisements/16/comments', {
			comment: params
		})
		.then(resp => {
			// transform response for the next function
			return resp.json();
		})
		.then(comment => {
			AppDispatcher.dispatch({
				actionType: Constants.ADD_COMMENT,
				comment: comment
			});
		});
	}

	static setComments(params){
		AppDispatcher.dispatch({
			actionType: Constants.SET_COMMENTS,
			comments: params
		});
	}
}

export default Actions;