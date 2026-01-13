import { configureStore } from '@reduxjs/toolkit'
import rootReducer from './reducers/rootReducer'

const preloadedState = {};

export const store = configureStore({
  reducer: rootReducer,
  preloadedState
})

export type AppStore = typeof store
export type AppDispatch = typeof store.dispatch
export type RootState = ReturnType<typeof store.getState>
