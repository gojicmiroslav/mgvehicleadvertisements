import React from 'react';
import ReactOnRails from 'react-on-rails';

import CommentList from '../containers/CommentList';

const CommentApp = (props) => (
  <CommentList {...props} />
);

ReactOnRails.register({ CommentApp });
