import React, { PropTypes } from 'react';

class CommentForm extends React.Component {
	constructor(){
		super();
		this.defaultState = { author: '', body: '' };
		this.state = this.defaultState;
	}

	static get contextTypes(){
		return {
			actions: React.PropTypes.func.isRequired
		};
	}

	onInputChange(event){
		let prop = {};
		// event.target -> inpup
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

		this.context.actions.addComment(this.state);
		this.setState(this.defaultState);
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
				<form>
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