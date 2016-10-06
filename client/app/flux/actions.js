import Constants from './constants';
import AppDispatcher from './dispatcher';

class Actions {
	static addComment(params){
		AppDispatcher.dispatch({
			actionType: Constants.ADD_COMMENT,
			comment: params
		});
	}
}

export default Actions;