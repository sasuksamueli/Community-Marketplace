import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

// Add paths that don't require authentication
const publicPaths = [
  '/',
  '/login',
  '/signup',
  '/forgot-password',
  '/api/auth/login',
  '/api/auth/signup',
]

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl

  // Allow public paths
  if (publicPaths.some(path => pathname.startsWith(path))) {
    return NextResponse.next()
  }

  // Check for user session
  const userSession = request.cookies.get('user_session')

  // If no session and trying to access protected route, redirect to login
  if (!userSession) {
    const loginUrl = new URL('/login', request.url)
    // Store the current path to redirect back after login
    loginUrl.searchParams.set('from', pathname)
    return NextResponse.redirect(loginUrl)
  }

  // If user has session and tries to access login/signup, redirect to dashboard
  if (userSession && (pathname === '/login' || pathname === '/signup')) {
    return NextResponse.redirect(new URL('/dashboard', request.url))
  }

  // Clone the request headers and add user info
  const requestHeaders = new Headers(request.headers)
  try {
    const sessionData = JSON.parse(userSession.value)
    requestHeaders.set('x-user-id', sessionData.id)
    requestHeaders.set('x-user-role', sessionData.role)
  } catch (error) {
    console.error('Error parsing session data:', error)
    // If session is invalid, clear it and redirect to login
    const response = NextResponse.redirect(new URL('/login', request.url))
    response.cookies.delete('user_session')
    return response
  }

  // Return response with modified headers
  return NextResponse.next({
    request: {
      headers: requestHeaders,
    },
  })
}

// Update the matcher to exclude more static files and API routes
export const config = {
  matcher: [
    /*
     * Match all request paths except:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * - public folder
     * - api routes (except auth)
     */
    '/((?!_next/static|_next/image|favicon.ico|public/|api/(?!auth)).*)',
  ],
} 