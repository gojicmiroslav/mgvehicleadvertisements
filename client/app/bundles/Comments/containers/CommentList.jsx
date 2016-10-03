import React, { PropTypes } from 'react';
import Comment from '../components/Comment';

// Simple example of a React "smart" component
export default class CommentList extends React.Component {
    static get propTypes(){
        return {
            comments: PropTypes.array.isRequired, 
        }
    }

    constructor(props, context) {
        super(props, context);
        this.state = { comments: this.props.comments };
    }

    render() {
        return (
            <div>
                {this.state.comments.map((comment,i) => {
                    return <Comment 
                                key={i}
                                author={comment.author} 
                                body={comment.body} 
                                created_at={comment.created_at} />
                })}
            </div>
        );
    }
}
