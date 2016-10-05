import React, { PropTypes } from 'react';
import Comment from '../components/Comment';
import CommentStore from '../../../flux/stores/comment_store';

export default class CommentList extends React.Component {
    static get propTypes(){
        return {
            comments: PropTypes.array, 
        }
    }

    constructor(props, context) {
        super(props, context);
        this.state = { comments: this.props.comments };
        this._onChange = this._onChange.bind(this);
    }

    componentDidMount(){
       CommentStore.addChangeListener(this._onChange);
    }
 
    componentWillUnmount(){
       CommentStore.removeChangeListener(this._onChange);
    }
 
    _onChange(){
       this.forceUpdate();
    }

    render() {
        console.log('Render...');
        return (
            <div>
                {CommentStore.comments().map((comment,i) => {
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

window.Component = React.Component;
window.CommentList = CommentList;