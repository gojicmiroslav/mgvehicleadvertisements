import React from 'react';
import ReactOnRails from 'react-on-rails';
import CommentSection from '../containers/CommentSection';
import CommentStore from '../../../flux/stores/comment_store';

const CommentApp = (props) => (
  	<CommentSection {...props}/>
);

ReactOnRails.register({ CommentApp });
