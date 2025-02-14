import { createSlice } from "@reduxjs/toolkit";

export interface SessionState {
  currentUser: number | null,
  isAuthenticated: boolean,
  error: null
}

const initialState: SessionState = {
  currentUser: null,
  isAuthenticated: false,
  error: null
}

export const sessionSlice = createSlice({
  name: 'session',
  initialState,
  reducers: {
    loginSuccess: (state, action) => {
      state.currentUser = action.payload
      state.isAuthenticated = true
      state.error = null
    },
    logout: state => {
      state.currentUser = null
      state.isAuthenticated = false
      state.error = null
    },
    restoreSession: (state, action) => {
      state.currentUser = action.payload
      state.isAuthenticated = Boolean(action.payload)
      state.error = null
    },
    sessionError: (state, action) => {
      state.error = action.payload
    },
    clearSessionError: state => {
      state.error = null
    }
  }
});

export const { loginSuccess, logout, restoreSession, sessionError, clearSessionError } = sessionSlice.actions
export default sessionSlice.reducer