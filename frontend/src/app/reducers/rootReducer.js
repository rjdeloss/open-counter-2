import { combineReducers } from "@reduxjs/toolkit";
import sessionReducer from './sessionReducer' 

export default combineReducers({
  session: sessionReducer
})