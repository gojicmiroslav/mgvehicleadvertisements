import React from 'react';
import ReactOnRails from 'react-on-rails';
import CommentSection from '../containers/CommentSection';
import CommentStore from '../../../flux/stores/comment_store';
import Actions from '../../../flux/actions';

const CommentApp = (props) => (
  <CommentSection />
);

ReactOnRails.register({ CommentApp });
