# Community Marketplace

A complete community marketplace application similar to Karrot, built with PHP, MySQL, and vanilla JavaScript. Users can buy and sell items locally with WhatsApp contact integration.

## Features

- **User Authentication**: Registration, login, and profile management
- **Item Listings**: Post, edit, and manage marketplace listings
- **Search & Filtering**: Browse by category, price, location, and keywords
- **WhatsApp Integration**: Contact sellers directly via WhatsApp
- **Image Upload**: Support for item photos
- **Responsive Design**: Mobile-friendly interface
- **Admin Panel**: Moderation capabilities

## Tech Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Backend**: PHP 7.4+
- **Database**: MySQL 5.7+
- **Authentication**: PHP Sessions
- **File Upload**: PHP file handling

## Installation

### Prerequisites

- Web server (Apache/Nginx)
- PHP 7.4 or higher
- MySQL 5.7 or higher
- mod_rewrite enabled (for Apache)

### Setup Steps

1. **Clone/Download** the project files to your web server directory

2. **Database Setup**:
   \`\`\`sql
   CREATE DATABASE marketplace;
   \`\`\`
   Import the schema from `database/schema.sql`

3. **Configuration**:
   Update `includes/config.php` with your database credentials:
   \`\`\`php
   define('DB_HOST', 'localhost');
   define('DB_NAME', 'marketplace');
   define('DB_USER', 'your_username');
   define('DB_PASS', 'your_password');
   \`\`\`

4. **File Permissions**:
   \`\`\`bash
   chmod 755 public/images/
   chmod 644 public/.htaccess
   \`\`\`

5. **Web Server Configuration**:
   - Point your domain to the `public/` directory
   - Ensure mod_rewrite is enabled for Apache
   - For Nginx, configure URL rewriting similar to the .htaccess rules

## Project Structure

\`\`\`
/marketplace
├── /public               # Web root directory
│   ├── /css              # Stylesheets
│   ├── /js               # Frontend JavaScript
│   ├── /images           # Uploaded images
│   ├── /api              # PHP API endpoints
│   ├── index.html        # Homepage
│   ├── login.html        # Authentication
│   ├── post.html         # Create listing
│   ├── listing.html      # View listing
│   ├── profile.html      # User profile
│   └── .htaccess         # URL rewriting
├── /includes             # PHP classes
│   ├── Database.php      # Database wrapper
│   ├── Auth.php          # Authentication
│   └── config.php        # Configuration
└── /database             # SQL schema
\`\`\`

## API Endpoints

### Authentication
- `POST /api/auth.php?action=register` - User registration
- `POST /api/auth.php?action=login` - User login
- `POST /api/auth.php?action=logout` - User logout
- `GET /api/auth.php?action=me` - Get current user

### Listings
- `GET /api/listings.php?action=all` - Get all listings (with filters)
- `GET /api/listings.php?action=single&id={id}` - Get single listing
- `GET /api/listings.php?action=my` - Get user's listings
- `POST /api/listings.php?action=create` - Create new listing
- `PUT /api/listings.php?action=mark_sold&id={id}` - Mark as sold
- `DELETE /api/listings.php?id={id}` - Delete listing

### Categories
- `GET /api/categories.php` - Get all categories

### Users
- `PUT /api/users.php?action=update` - Update user profile

## Usage

### For Buyers
1. Browse listings on the homepage
2. Use search and filters to find specific items
3. Click on items to view details
4. Contact sellers via WhatsApp

### For Sellers
1. Register/login to your account
2. Click "Sell" to post a new item
3. Fill in item details and upload a photo
4. Manage your listings in your profile
5. Respond to buyer inquiries via WhatsApp

### WhatsApp Integration
- Sellers provide their WhatsApp number during registration
- Buyers can contact sellers with pre-filled messages
- No internal messaging system - all communication via WhatsApp

## Security Features

- Password hashing with PHP's `password_hash()`
- SQL injection prevention with prepared statements
- XSS protection with proper output escaping
- File upload validation and restrictions
- Session-based authentication
- CSRF protection considerations

## Customization

### Adding New Categories
Update the categories in `database/schema.sql` or add them via the database:
\`\`\`sql
INSERT INTO categories (name, icon) VALUES ('New Category', '🆕');
\`\`\`

### Styling
Modify `public/css/style.css` to customize the appearance.

### Features
Extend functionality by:
- Adding more user profile fields
- Implementing favorites/wishlist
- Adding rating/review system
- Creating admin dashboard
- Adding email notifications

## Deployment

### Shared Hosting
1. Upload files to your hosting account
2. Create MySQL database and import schema
3. Update configuration with hosting credentials
4. Set document root to `public/` directory

### VPS/Dedicated Server
1. Configure web server (Apache/Nginx)
2. Set up SSL certificate
3. Configure database
4. Set proper file permissions
5. Enable security headers

## Troubleshooting

### Common Issues

**Database Connection Failed**
- Check database credentials in `config.php`
- Ensure MySQL service is running
- Verify database exists

**File Upload Issues**
- Check `public/images/` directory permissions
- Verify PHP upload settings (`upload_max_filesize`, `post_max_size`)

**URL Rewriting Not Working**
- Ensure mod_rewrite is enabled
- Check .htaccess file permissions
- Verify web server configuration

**WhatsApp Links Not Working**
- Ensure phone numbers include country code
- Check URL encoding of messages

## License

This project is open source and available under the MIT License.

## Support

For issues and questions:
1. Check the troubleshooting section
2. Review the code comments
3. Test with browser developer tools
4. Check server error logs
