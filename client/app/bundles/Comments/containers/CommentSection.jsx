import React, { PropTypes } from 'react';
import CommentStore from '../../../flux/stores/comment_store';
import CommentList from '../components/CommentList';

class CommentSection extends React.Component {
	constructor(){
		super();
		this.store = new CommentStore();
	}

	render(){
		return(
			<CommentList store={this.store}/>
		);
	}
}

export default CommentSection;