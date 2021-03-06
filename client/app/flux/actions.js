import Constants from './constants';
import AppDispatcher from './dispatcher';
import Api from './../lib/api';

class Actions {
	constructor(advertisementId){
		this.advertisementId = advertisementId;
		this.watchInterval = setInterval(this.watch.bind(this), 1000);
	}

	addComment(params){
		Api.post(`/advertisements/${this.advertisementId}/comments`, {
			comment: params
		})
		.then(resp => {
			// transform response for the next function
			return resp;
		})
		.then(comment => {
			AppDispatcher.dispatch({
				actionType: Constants.ADD_COMMENT,
				comment: comment
			});
		});
	}

	setComments(params){
		AppDispatcher.dispatch({
			actionType: Constants.SET_COMMENTS,
			comments: params
		});
	}

	upvoteComment(comment){
		Api.put(`/advertisements/${this.advertisementId}/comments/${comment.id}/upvote`).then( resp => {
			return resp;
		}).then( comment => {
			AppDispatcher.dispatch({
				actionType: Constants.UPVOTE_COMMENT,
				comment: comment
			});
		});
	}

	watch(){
		Api.get(`/advertisements/${this.advertisementId}/comments`).then( comments => {
      		this.setComments(comments);
     	});
	}
}

export default Actions;
