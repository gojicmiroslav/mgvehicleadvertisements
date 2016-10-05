import Constants from './constants';
import AppDispatcher from './dispatcher';

class Actions {
	addComment(params){
		AppDispatcher.dispatch({
			actionType: Constants.ADD_COMMENT,
			comment: params
		});
	}
}

window.Actions = new Actions();
export default Actions;