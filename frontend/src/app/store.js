import { configureStore } from '@reduxjs/toolkit'
import rootReducer from './reducers/rootReducer'

export const store = (preloadedState = {}) => (configureStore({
  reducer: rootReducer,
  preloadedState
}))