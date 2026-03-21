import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm'

const SUPABASE_URL = 'https://hyvfevkghwvfwredjvwm.supabase.co'
const SUPABASE_KEY = 'sb_publishable_Vc3jS8aJwYkeg3o_Rr-7Vg_-tsLLt_p'

export const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)
