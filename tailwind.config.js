module.exports = {
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    themes: ["light"]
  }
}
