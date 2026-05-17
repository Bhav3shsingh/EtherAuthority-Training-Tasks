import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default{
  server:{
    watch:{
      usePolling:true,
    },
  },
}

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
})
