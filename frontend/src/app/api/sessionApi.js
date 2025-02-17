const user_url = `api/users`
const session_url = `api/session`

export const signup = async user => {
  try {
    const response = await fetch(user_url, {
      method: "POST",
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({user})
    })

    if (!response.ok) throw new Error(response.status)
    
    return response.json()

  } catch (error) {
    console.error('Signup failed', error)
    throw error
  }
}

export const login = async user => {
  try {
    const response = await fetch(user_url, {
      method: "POST",
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify({user})
    })

    if (!response.ok) throw new Error(response.status)
    
    return response.json()

  } catch (error) {
    console.error('Login failed', error)
    throw error
  }
}

export const logout = async () => {
  try {
    const response = await fetch(session_url, { method: "DELETE" })
    if (!response.ok) throw new Error(response.status)
  } catch (error) {
    console.log('Logout failed', error)
    throw error
  }
}