import { supabase } from './supabase.js'

export async function login(email, password) {
  const { data, error } = await supabase.auth.signInWithPassword({ email, password })
  if (error) throw error
  return data
}

export async function logout() {
  sessionStorage.removeItem('userRole')
  await supabase.auth.signOut()
  window.location.href = '/index.html'
}

export async function getUser() {
  const { data } = await supabase.auth.getUser()
  return data.user
}

export async function getProfile(userId) {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .maybeSingle()
  if (error) throw error
  return data
}

export async function requireAuth(role) {
  const user = await getUser()
  if (!user) {
    window.location.href = '/index.html'
    return null
  }
  const profile = await getProfile(user.id)
  // Admin can access teacher pages too
  const effectiveRole = profile?.role === 'admin' ? 'teacher' : profile?.role
  if (!profile || (role && effectiveRole !== role)) {
    window.location.href = '/index.html'
    return null
  }
  // Pending teachers cannot access the app
  if (profile.role === 'teacher' && profile.status === 'pending') {
    window.location.href = '/index.html'
    return null
  }
  sessionStorage.setItem('userRole', profile.role)
  return { user, profile }
}
