import {Dispatcher} from 'flux';
import CommentStore from './stores/comment_store';
import Constants from './constants';

var AppDispatcher = new Dispatcher();

export default AppDispatcher;