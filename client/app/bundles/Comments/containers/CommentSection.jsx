import React, { PropTypes } from 'react';
import CommentStore from '../../../flux/stores/comment_store';
import CommentList from '../components/CommentList';
import CommentForm from '../components/CommentForm';
import Actions from '../../../flux/actions';

class CommentSection extends React.Component {
	constructor(props){
		super();
		this.store = new CommentStore();
		this.actions = Actions;
		this.actions.setComments(props);
	}

	static get childContextTypes(){
		return {
			store: React.PropTypes.object.isRequired,
			actions: React.PropTypes.func.isRequired
		}
	}

	getChildContext(){
		// store can be access in cild via this.context.store
		return {
			store: this.store,
			actions: this.actions
		}
	}

	render(){
		return(
			<div>
				<CommentForm />
				<CommentList />
			</div>
		);
	}
}

export default CommentSection;