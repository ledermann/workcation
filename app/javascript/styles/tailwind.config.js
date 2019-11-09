module.exports = {
  theme: {
    customForms: theme => ({
      default: {
        input: {
          borderRadius: theme('borderRadius.lg'),
          "&:focus": {
            boxShadow: 'none',
          }
        },
        radio: {
          width: '1.5em',
          height: '1.5em',
          "&:focus": {
            boxShadow: 'none',
          }
        },
        checkbox: {
          width: '1.5em',
          height: '1.5em',
          borderRadius: theme('borderRadius.lg'),
          "&:focus": {
            boxShadow: 'none',
          }
        },
        select: {
          lineHeight: theme('lineHeight.snug'),
          borderRadius: theme('borderRadius.lg'),
          icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#fff"><path d="M15.3 9.3a1 1 0 0 1 1.4 1.4l-4 4a1 1 0 0 1-1.4 0l-4-4a1 1 0 0 1 1.4-1.4l3.3 3.29 3.3-3.3z"/></svg>`,
        },
      },
      dark: {
        input: {
          borderColor: 'transparent',
          backgroundColor: theme('colors.gray.900'),
          color: theme('colors.white'),
          borderWidth: 0,
          '&::placeholder': {
            color: theme('colors.gray.600')
          },
          "&:focus": {
            borderColor: 'transparent',
            color: theme('colors.gray.900'),
            backgroundColor: theme('colors.white')
          }
        },
        radio: {
          borderColor: 'transparent',
          color: theme('colors.indigo.500'),
          backgroundColor: theme('colors.gray.900'),
          "&:focus": {
            borderColor: theme('colors.indigo.500'),
            backgroundColor: theme('colors.gray.700')
          }
        },
        checkbox: {
          color: theme('colors.indigo.500'),
          borderColor: 'transparent',
          backgroundColor: theme('colors.gray.900'),
          "&:focus": {
            borderColor: theme('colors.indigo.500'),
            backgroundColor: theme('colors.gray.700')
          }
        },
        select: {
          borderColor: 'transparent',
          backgroundColor: theme('colors.gray.700'),
          color: theme('colors.white'),
          "&:focus": {
            backgroundColor: theme('colors.gray.600'),
          }
        },
      },
      light: {
        input: {
          color: theme('colors.gray.900'),
          borderColor: 'transparent',
          borderWidth: '1px',
          backgroundColor: theme('colors.gray.200'),
          '&::placeholder': {
            color: theme('colors.gray.600')
          },
          "&:focus": {
            borderColor: theme('colors.gray.300'),
            backgroundColor: theme('colors.white'),
          }
        },
      }
    })
  },
  variants: {},
  plugins: [
    require('@tailwindcss/custom-forms')
  ]
}
