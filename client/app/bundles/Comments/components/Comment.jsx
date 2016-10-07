import React, { PropTypes } from 'react';

export default class Comment extends React.Component {
	static get propTypes(){
		return {
			id: React.PropTypes.number,
			author: React.PropTypes.string,
			body: React.PropTypes.string,
			rank: React.PropTypes.number,
			created_at: React.PropTypes.string
		}
	}

	constructor(){
		super();
	}

	render(){
		return(
			<div className="panel panel-default">
     			<div className="panel-heading">
	           		<p><b>Posted:</b> { this.props.created_at }</p>
    	       		<p className="text-primary"><b>Author: <i>{this.props.author}</i></b></p>
     			</div>
     			<div className="panel-body">{this.props.body}</div>
     		</div>
     	);
	}
}