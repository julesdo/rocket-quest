import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://kcchccccmsrxqppwbwhe.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtjY2hjY2NjbXNyeHFwcHdid2hlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc1OTMxNTcsImV4cCI6MjA1MzE2OTE1N30.GYBMhWNq44T52KDg9AzS4C8f-qukBjOM8VrkxQBzQfw'

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)
