import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/sessionAction";

const initialState = {
  currentUser: null,
  isAuthenticated: false,
  error: null
}

export default sessionReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return { ...state, currentUser: action.currentUser, isAuthenticated: true };
    case LOGOUT_CURRENT_USER:
      return { ...state, initialState }
    default:
      return state
  }
}