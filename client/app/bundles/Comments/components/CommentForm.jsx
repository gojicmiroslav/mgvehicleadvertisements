import React, { PropTypes } from 'react';
import _ from 'lodash';

class CommentForm extends React.Component {
	static get propTypes(){
		return {
			parent_id: React.PropTypes.number,
			isReplying: React.PropTypes.bool,
			onCommentSubmitted: React.PropTypes.func
		}
	}

	constructor(props){
		super();
		this.defaultState = { author: '', body: ''};
		this.state = this.defaultState;
	}

	static get contextTypes(){
		return {
			actions: React.PropTypes.object.isRequired
		};
	}

	onInputChange(event){
		let prop = {};
		// event.target -> input
		//event.target.name - >input name -> author
		//event.target.value -> input value -> entered value
		prop[event.target.name] = event.target.value;
		this.setState(prop);
	}

	submitComment(event){
		event.preventDefault();
		//validation
		if(!this.commentFormIsValid()){
			return;
		}
		
		this.context.actions.addComment(_.merge(this.state, { parent_id: this.props.parent_id }));
		this.setState(this.defaultState);
		if(this.props.onCommentSubmitted){
			this.props.onCommentSubmitted();
		}
	}

	commentFormIsValid(){
		var formIsValid = true;
		// this.state.errors = {};

		// if(this.state.author.firstName.length < 3){
		// 	this.state.errors.firstName = "First name must be at lest 3 characters!";
		// 	formIsValid = false;
		// }

		// if(this.state.author.lastName.length < 3){
		// 	this.state.errors.lastName = "Last name must be at lest 3 characters!";
		// 	formIsValid = false;
		// }

		// this.setState({ errors: this.state.errors });
		return formIsValid;
	}

	render(){
		return (
			<div>
				<form className={this.props.isReplying ? '' : 'hidden'}>
					<div className="form-group">
						<label>Author:</label>
						<input  type="text" 
								name="author" 
								className="form-control" 
								value={this.state.author} 
								onChange={this.onInputChange.bind(this)} />
					</div>
					<div className="form-group">
						<label>Comment:</label>
						<textarea name="body" 
								  className="form-control" 
								  value={this.state.body}
								  onChange={this.onInputChange.bind(this)} />
					</div>

					<button type="submit" className="btn btn-primary" onClick={this.submitComment.bind(this)} >Submit</button>
				</form>
			</div>
		);
	}
}

export default CommentForm;