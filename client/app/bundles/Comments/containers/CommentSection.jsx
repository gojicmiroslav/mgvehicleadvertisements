import React, { PropTypes } from 'react';
import CommentStore from '../../../flux/stores/comment_store';
import CommentList from '../components/CommentList';
import CommentForm from '../components/CommentForm';
import Actions from '../../../flux/actions';

class CommentSection extends React.Component {
	constructor(props){
		super();
		this.store = new CommentStore();
		this.actions = new Actions(props[0].advertisement_id);
		this.actions.setComments(props);
	}

	static get childContextTypes(){
		return {
			store: React.PropTypes.object.isRequired,
			actions: React.PropTypes.object.isRequired
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
				<CommentForm isReplying={true} />
				<hr />
				<CommentList parent_id={null} />
			</div>
		);
	}
}

export default CommentSection;
