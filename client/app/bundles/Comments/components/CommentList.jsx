import React, { PropTypes } from 'react';
import Comment from '../components/Comment';
import CommentStore from '../../../flux/stores/comment_store';

export default class CommentList extends React.Component {
    static get propTypes(){
        return {
            parent_id: React.PropTypes.number
        }
    }

    static get contextTypes(){
        return {
            store: React.PropTypes.object.isRequired
        }
    }

    constructor(props){
        super();
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
            <ul>
                {this.context.store.comments(this.props.parent_id).map((comment,i) => {
                    return  <Comment key={comment.id} {...comment} />
                })}
            </ul>
        );
    }
}
