import React, { PropTypes } from 'react';
import CommentForm from './CommentForm';
import CommentList from './CommentList'

export default class Comment extends React.Component {
	static get propTypes(){
		return {
			id: React.PropTypes.number,
			author: React.PropTypes.string,
			body: React.PropTypes.string,
			created_at: React.PropTypes.string,
			rank: React.PropTypes.number
		}
	}

	static get contextTypes(){
		return {
			actions: React.PropTypes.object.isRequired
		};
	}

	constructor(props){
		super();
		this.state = { isReplying: false };
	}

	onToggleReply(){
		this.setState({ isReplying: !this.state.isReplying });
	}

	onCommentSubmitted(event){
		this.setState({ isReplying: false });
	}

	onUpvote(event){
		this.context.actions.upvoteComment(this.props);
	}

	render(){
		const replyText = this.state.isReplying ? 'Hide' : 'Reply';
		return(
			<li className="comment">
				<div className="panel panel-default">
	     			<div className="panel-heading">
		           		<p><b>Posted:</b> { this.props.created_at }</p>
	    	       		<p className="text-primary"><b>Author: <i>{this.props.author}</i></b></p>
	     			</div>
	     			<div className="panel-body">
	     				<blockquote> {this.props.body} </blockquote> <hr />
	     				<b>Rank:</b> <span className="label label-default">{this.props.rank || 0}</span><br /><br />
	     				<button className="btn btn-info btn-sm" onClick={this.onToggleReply.bind(this)}>
              				{replyText}
            			</button>
            			<button className="btn btn-primary btn-sm" onClick={this.onUpvote.bind(this)}>+1</button>
            			<hr />
	     				<CommentForm 
	     					parent_id={this.props.id} 
	     					isReplying={this.state.isReplying} 
	     					onCommentSubmitted={this.onCommentSubmitted.bind(this)} />
	     				<CommentList parent_id={this.props.id} />
	     			</div>
	     		</div>
     		</li>
     	);
	}
}
