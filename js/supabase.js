import { createClient } from 'https://esm.sh/@supabase/supabase-js'

const SUPABASE_URL = 'https://hyvfevkghwvfwredjvwm.supabase.co'
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh5dmZldmtnaHd2ZndyZWRqdndtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQxMTIwNjUsImV4cCI6MjA4OTY4ODA2NX0.O0jSU1MAWxLXfqudmVbamvbm0AQfCWA5aN2Wzed5aLQ'

export const supabase = createClient(SUPABASE_URL, SUPABASE_KEY)
