import ReactDOMServer from 'react-dom/server'
import { createInertiaApp } from '@inertiajs/inertia-react'
import cjsCreateServer from '@inertiajs/server'

const pages = import.meta.globEagerDefault('../pages/**/*.tsx')

// Unwrap the CJS module in @inertiajs/server.
const createServer = typeof cjsCreateServer === 'function' ? cjsCreateServer : cjsCreateServer.default

createServer((page) => createInertiaApp({
  page,
  render: ReactDOMServer.renderToString,
  resolve: name => {
    console.log("bello ", pages)
    return pages[`../pages/${name}.tsx`]
  },
  setup: ({ App, props }) => <App {...props} />,
}))
