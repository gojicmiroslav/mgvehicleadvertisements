import React, { PropTypes } from 'react';
import Comment from '../components/Comment';
import CommentStore from '../../../flux/stores/comment_store';

export default class CommentList extends React.Component {
    static get contextTypes(){
        return {
            store: React.PropTypes.object.isRequired
        }
    }

    constructor(props, context) {
        super(props, context);
        this.state = { comments: this.props.comments };
    }

    componentDidMount(){
       this.context.store.addChangeListener(this._onChange.bind(this));
    }
 
    componentWillUnmount(){
       this.context.store.removeChangeListener(this._onChange.bind(this));
    }
 
    _onChange(){
       this.forceUpdate();
    }

    render() {
        console.log('Render...');
        return (
            <div>
                {this.context.store.comments().map((comment,i) => {
                    return  <Comment 
                                key={i}
                                author={comment.author} 
                                body={comment.body} 
                                created_at={comment.created_at} />
                })}
            </div>
        );
    }
}
