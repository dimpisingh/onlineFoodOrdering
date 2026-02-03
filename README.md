# ServeNow
## Online Food Delivery App
### Overview
This project is an Online Food Delivery application designed to streamline the food ordering process for both customers and restaurant owners. It leverages Spring Boot for the backend, and integrates several other technologies to ensure robust authentication .

## Features
### User Authentication: Utilizes Spring Security with JWT for secure authentication.
### Secure Payments: Integrated with Stripe payment gateway for secure and seamless transactions.
### Role-Based Access Control: Differentiates between customer and owner roles to provide personalized user experiences.
### Real-Time Updates: Continuously enhanced based on user feedback and market trends.
### Technologies Used
### Backend:
Spring Boot
Spring Security
MySQL
JWT (JSON Web Tokens)
## Installation and Setup
Prerequisites
Java 11 or higher
Node.js and npm
MySQL database
Stripe account for payment processing
Backend Setup
## Register and Login:
Users can register and log in to the application. JWT is used for secure authentication.
## Order Food:
Customers can browse through the menu, add items to their cart, and place orders.
## Manage Orders:
Restaurant owners can manage incoming orders, update their status, and manage the menu.

## Controllers Documentation

This document provides a concise reference for the controllers in the `com.foodOrdering.controller` package. For each controller you'll find the base path, the exposed endpoints (HTTP method + path), a short description, required headers (Authorization JWT where applicable), request payload classes, and response types.

> Note: Most endpoints require an `Authorization` header with a JWT. The header is shown as `Authorization: Bearer <token>` though the controllers read the full header string.

---

### AuthController

- Base path: `/auth`

Endpoints:

- POST `/auth/signup`
	- Description: Register a new user. Creates a `User` and an empty `Cart`, returns a JWT on success.
	- Request body: `User` (email, fullName, role, password)
	- Response: `AuthResponse` (jwt, message, role)
	- Response status: `201 Created`

- POST `/auth/signin`
	- Description: Authenticate an existing user. Returns JWT and role.
	- Request body: `LoginRequest` (email, password)
	- Response: `AuthResponse` (jwt, message, role)
	- Response status: `200 OK`

---

### CartController

- Base path: `/api`

Endpoints:

## Controllers Documentation

This document provides a concise reference for the controllers in the `com.foodOrdering.controller` package. For each controller you'll find the base path, the exposed endpoints (HTTP method + path), a short description, required headers (Authorization JWT where applicable), request payload classes, and response types.

> Note: Most endpoints require an `Authorization` header with a JWT. The header is shown as `Authorization: Bearer <token>` though the controllers read the full header string.

---

### AuthController

- Base path: `/auth`

Endpoints:

- POST `/auth/signup`
	- Description: Register a new user. Creates a `User` and an empty `Cart`, returns a JWT on success.
	- Request body: `User` (email, fullName, role, password)
	- Response: `AuthResponse` (jwt, message, role)
	- Response status: `201 Created`

- POST `/auth/signin`
	- Description: Authenticate an existing user. Returns JWT and role.
	- Request body: `LoginRequest` (email, password)
	- Response: `AuthResponse` (jwt, message, role)
	- Response status: `200 OK`

---

### CartController

- Base path: `/api`

Endpoints:

- PUT `/api/cart/add`
	- Description: Add an item to the authenticated user's cart.
	- Request body: `AddCartItemRequest`
	- Required header: `Authorization` (JWT)
	- Response: `CartItem` (`200 OK`)

- PUT `/api/cart-item/update`
	- Description: Update quantity of a cart item.
	- Request body: `UpdateCartItemRequest` (cartItemId, quantity)
	- Required header: `Authorization` (JWT)
	- Response: `CartItem` (`200 OK`)

- DELETE `/api/cart-item/{id}/remove`
	- Description: Remove a cart item by id.
	- Path param: `id` (cart item id)
	- Required header: `Authorization` (JWT)
	- Response: `Cart` (`200 OK`)

- PUT `/api/cart/clear`
	- Description: Clear the authenticated user's cart.
	- Required header: `Authorization` (JWT)
	- Response: `Cart` (`200 OK`)

- GET `/api/cart`
	- Description: Get the authenticated user's cart.
	- Required header: `Authorization` (JWT)
	- Response: `Cart` (`200 OK`)

---

### CategoryController

- Base path: `/api`

Endpoints:

- POST `/api/admin/category`
	- Description: Create a new category (admin).
	- Request body: `Category` (name)
	- Required header: `Authorization` (JWT)
	- Response: `Category` (`201 Created`)

- GET `/api/category/restaurant/{id}`
	- Description: Get categories for a restaurant.
	- Path param: `id` (restaurant id)
	- Required header: `Authorization` (JWT)
	- Response: `List<Category>` (`201 Created` in code, logically `200 OK`)

---

### FoodController

- Base path: `/api/food`

Endpoints:

- GET `/api/food/search?name={name}`
	- Description: Search foods by name.
	- Query param: `name`
	- Required header: `Authorization` (JWT)
	- Response: `List<Food>` (`201 Created` in code, logically `200 OK`)

- GET `/api/food/restaurant/{restaurantId}`
	- Description: List foods for a restaurant, optional filters: `vegetarian`, `seasonal`, `nonVegetarian`, `food_category`.
	- Path param: `restaurantId`
	- Query params: `vegetarian`, `seasonal`, `nonVegetarian`, `food_category` (all optional)
	- Required header: `Authorization` (JWT)
	- Response: `List<Food>` (`200 OK`)

---

### HomeController

- Base path: `/` (root)

Endpoints:

- GET `/`
	- Description: Simple welcome endpoint used as a health/info route.
	- Response: `String` (`200 OK`)

---

### IngredientController

- Base path: `/api/admin/ingredients`

Endpoints:

- POST `/api/admin/ingredients/category`
	- Description: Create ingredient category for a restaurant.
	- Request body: `IngredientCategoryRequest` (name, restaurantId)
	- Response: `IngredientCategory` (`201 Created`)

- POST `/api/admin/ingredients`
	- Description: Create an ingredient item.
	- Request body: `IngredientRequest` (restaurantId, name, categoryId)
	- Response: `IngredientsItem` (`201 Created`)

- PUT `/api/admin/ingredients/{id}/stock`
	- Description: Update stock for an ingredient item by id.
	- Path param: `id`
	- Response: `IngredientsItem` (`200 OK`)

- GET `/api/admin/ingredients/restaurant/{id}`
	- Description: List all ingredients for a restaurant.
	- Path param: `id`
	- Response: `List<IngredientsItem>` (`200 OK`)

- GET `/api/admin/ingredients/restaurant/{id}/category`
	- Description: List ingredient categories for a restaurant.
	- Path param: `id`
	- Response: `List<IngredientCategory>` (`200 OK`)

---

### OrderController

- Base path: `/api`

Endpoints:

- POST `/api/order`
	- Description: Create an order for the authenticated user and return a payment link.
	- Request body: `OrderRequest`
	- Required header: `Authorization` (JWT)
	- Response: `PaymentResponse` (`200 OK`)

- GET `/api/order/user`
	- Description: Get order history for the authenticated user.
	- Required header: `Authorization` (JWT)
	- Response: `List<Order>` (`200 OK`)

---

### RestaurantController

- Base path: `/api/restaurants`

Endpoints:

- GET `/api/restaurants/search?keyword={keyword}`
	- Description: Search restaurants by keyword.
	- Query param: `keyword`
	- Required header: `Authorization` (JWT)
	- Response: `List<Restaurant>` (`200 OK`)

- GET `/api/restaurants` 
	- Description: List all restaurants.
	- Required header: `Authorization` (JWT)
	- Response: `List<Restaurant>` (`200 OK`)

- GET `/api/restaurants/{id}`
	- Description: Get a restaurant by id.
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `Restaurant` (`200 OK`)

- PUT `/api/restaurants/{id}/add-favorites`
	- Description: Add a restaurant to the authenticated user's favorites; returns a `RestaurantDto`.
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `RestaurantDto` (`200 OK`)

---

### UserController

- Base path: `/api/users`

Endpoints:

- GET `/api/users/profile`
	- Description: Get profile information for the authenticated user.
	- Required header: `Authorization` (JWT)
	- Response: `User` (`200 OK`)

---

### AdminRestaurantController

- Base path: `/api/admin/restaurants`

Endpoints:

- POST `/api/admin/restaurants`
	- Description: Create a restaurant (admin/owner).
	- Request body: `CreateRestaurantRequest`
	- Required header: `Authorization` (JWT)
	- Response: `Restaurant` (`201 Created`)

- PUT `/api/admin/restaurants/{id}`
	- Description: Update restaurant details.
	- Path param: `id`
	- Request body: `CreateRestaurantRequest`
	- Required header: `Authorization` (JWT)
	- Response: `Restaurant` (`201 Created`)

- DELETE `/api/admin/restaurants/{id}`
	- Description: Delete a restaurant.
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `MessageResponse` (`200 OK`)

- PUT `/api/admin/restaurants/{id}/status`
	- Description: Toggle/update restaurant status (active/inactive).
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `Restaurant` (`200 OK`)

- GET `/api/admin/restaurants/user`
	- Description: Get restaurant for the authenticated user (owner).
	- Required header: `Authorization` (JWT)
	- Response: `Restaurant` (`200 OK`) or `403 Forbidden` on error

---

### AdminOrderController

- Base path: `/api/admin`

Endpoints:

- GET `/api/admin/order/restaurant/{id}`
	- Description: Get orders for a restaurant, optional `order_status` filter.
	- Path param: `id`
	- Query param: `order_status` (optional)
	- Required header: `Authorization` (JWT)
	- Response: `List<Order>` (`200 OK`)

- PUT `/api/admin/order/{id}/{orderStatus}`
	- Description: Update order status for a given order.
	- Path params: `id`, `orderStatus`
	- Required header: `Authorization` (JWT)
	- Response: `Order` (`200 OK`)

---

### AdminFoodController

- Base path: `/api/admin/food`

Endpoints:

- POST `/api/admin/food`
	- Description: Create a food item for the authenticated user's restaurant.
	- Request body: `CreateFoodRequest`
	- Required header: `Authorization` (JWT)
	- Response: `Food` (`201 Created`)

- DELETE `/api/admin/food/{id}`
	- Description: Delete a food by id.
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `MessageResponse` (`201 Created` in code, logically `200 OK`)

- PUT `/api/admin/food/{id}`
	- Description: Toggle/update food availability status by id.
	- Path param: `id`
	- Required header: `Authorization` (JWT)
	- Response: `Food` (`201 Created` in code, logically `200 OK`)

---

## Notes & Next Steps

- I summarized each controller's endpoints and inputs/responses from the source. I preserved the status codes as used in code but noted where `201 Created` is used in places that are logically `200 OK` (this may be intentional or a minor inconsistency to clean).
- Next steps (optional):
	- Add example request/response JSON for key endpoints.
	- Generate an OpenAPI/Swagger spec (Springdoc) for automated API docs.
	- Add method-level JavaDoc in controllers for richer documentation.

---

## Example requests & responses

Below are example request and response payloads for a handful of commonly-used endpoints. Replace placeholder values (IDs, JWTs, prices) with real values from your environment.

### Authentication

- POST `/auth/signup`

Request (application/json):

```json
{
  "email": "user@example.com",
  "fullName": "John Doe",
  "role": "CUSTOMER",
  "password": "StrongPassw0rd!"
}
```

Response (201 Created):

```json
{
  "jwt": "eyJhbGciOiJIUzI1NiIsInR...",
  "message": "Register Successful",
  "role": "CUSTOMER"
}
```

- POST `/auth/signin`

Request (application/json):

```json
{
  "email": "user@example.com",
  "password": "StrongPassw0rd!"
}
```

Response (200 OK):

```json
{
  "jwt": "eyJhbGciOiJIUzI1NiIsInR...",
  "message": "Login Successfull",
  "role": "CUSTOMER"
}
```

Include header when calling protected endpoints:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR...
```

### Cart — Add item

- PUT `/api/cart/add`

Request (application/json):

```json
{
  "foodId": 42,
  "quantity": 2,
  "ingredients": ["extra_cheese", "no_onion"]
}
```

Response (200 OK):

```json
{
  "id": 123,
  "food": {
    "id": 42,
    "name": "Margherita Pizza",
    "price": 799
  },
  "quantity": 2,
  "ingredients": ["extra_cheese","no_onion"]
}
```

### Orders — Create order

- POST `/api/order`

Request (application/json):

```json
{
  "restaurantId": 7,
  "deliveryAddress": {
    "street": "123 Main St",
    "city": "Springfield",
    "state": "IL",
    "zip": "62701"
  }
}
```

Response (200 OK):

```json
{
  "paymentUrl": "https://payments.example.com/link/abc123",
  "orderId": 987,
  "expiresAt": "2025-11-01T12:00:00"
}
```

### Restaurants — Create restaurant (owner/admin)

- POST `/api/admin/restaurants`

Request (application/json):

```json
{
  "name": "Tasty Bites",
  "description": "Homestyle comfort food",
  "cuisineType": "American",
  "address": {
    "street": "450 Market St",
    "city": "Metropolis",
    "state": "CA",
    "zip": "94105"
  },
  "contactInformation": {
    "phone": "+1-555-123-4567",
    "email": "owner@tastybites.example"
  },
  "openingHours": "09:00-21:00",
  "images": ["https://cdn.example.com/images/r1.jpg"]
}
```

Response (201 Created):

```json
{
  "id": 7,
  "name": "Tasty Bites",
  "description": "Homestyle comfort food",
  "cuisineType": "American",
  "address": { /* address object */ },
  "contactInformation": { /* contact object */ },
  "openingHours": "09:00-21:00",
  "images": ["https://cdn.example.com/images/r1.jpg"],
  "status": "PENDING_APPROVAL"
}
```

### Food — Create food (admin/owner)

- POST `/api/admin/food`

Request (application/json):

```json
{
  "name": "Spicy Chicken Burger",
  "description": "Grilled chicken with house spicy sauce",
  "price": 1299,
  "category": { "id": 3, "name": "Burgers" },
  "images": ["https://cdn.example.com/food/f1.jpg"],
  "restaurantId": 7,
  "vegetarian": false,
  "seasonal": false,
  "ingredients": [ { "id": 11, "name": "Chicken" }, { "id": 12, "name": "Lettuce" } ]
}
```

Response (201 Created):

```json
{
  "id": 42,
  "name": "Spicy Chicken Burger",
  "price": 1299,
### Additional example requests & responses

The following add more example pairs for endpoints that are commonly used during user flows (cart updates, categories, ingredients, admin order updates, favorites and profile).

### Cart — Update cart item quantity

- PUT `/api/cart-item/update`

Request (application/json):

```json
{
	"cartItemId": 123,
	"quantity": 3
}
```

Response (200 OK):

```json
{
	"id": 123,
	"food": { "id": 42, "name": "Margherita Pizza", "price": 799 },
	"quantity": 3,
	"ingredients": ["extra_cheese","no_onion"]
}
```

### Cart — Clear cart

- PUT `/api/cart/clear`

Response (200 OK):

```json
{
	"id": 55,
	"customer": { "id": 21, "fullName": "John Doe", "email": "user@example.com" },
	"items": []
}
```

### Category — Create category (admin)

- POST `/api/admin/category`

Request (application/json):

```json
{
	"name": "Desserts"
}
```

Response (201 Created):

```json
{
	"id": 9,
	"name": "Desserts"
}
```

### Category — Get restaurant categories

- GET `/api/category/restaurant/7`

Response (200 OK):

```json
[
	{ "id": 3, "name": "Pizzas" },
	{ "id": 9, "name": "Desserts" }
]
```

### Ingredients — Create category

- POST `/api/admin/ingredients/category`

Request (application/json):

```json
{
	"name": "Sauces",
	"restaurantId": 7
}
```

Response (201 Created):

```json
{
	"id": 15,
	"name": "Sauces",
	"restaurantId": 7
}
```

### Ingredients — Create ingredient item

- POST `/api/admin/ingredients`

Request (application/json):

```json
{
	"restaurantId": 7,
	"name": "Tomato Sauce",
	"categoryId": 15
}
```

Response (201 Created):

```json
{
	"id": 101,
	"name": "Tomato Sauce",
	"categoryId": 15,
	"restaurantId": 7,
	"stock": 50
}
```

### Ingredients — Update stock

- PUT `/api/admin/ingredients/101/stock`

Response (200 OK):

```json
{
	"id": 101,
	"name": "Tomato Sauce",
	"stock": 51
}
```

### Admin — Update order status

- PUT `/api/admin/order/987/COMPLETED`

Response (200 OK):

```json
{
	"id": 987,
	"restaurantId": 7,
	"status": "COMPLETED",
	"total": 2597,
	"items": [ { "foodId": 42, "name": "Margherita Pizza", "quantity": 2 } ]
}
```

### Restaurants — Add to favorites

- PUT `/api/restaurants/7/add-favorites`

Response (200 OK):

```json
{
	"id": 7,
	"name": "Tasty Bites",
	"isFavorite": true
}
```

### Users — Profile

- GET `/api/users/profile`

Response (200 OK):

```json
{
	"id": 21,
	"email": "user@example.com",
	"fullName": "John Doe",
	"role": "CUSTOMER",
	"addresses": [
		{ "street": "123 Main St", "city": "Springfield", "state": "IL", "zip": "62701" }
	]
}
```

---

If you'd like, I can also produce cURL examples for these pairs or add example HTTP headers and expected error responses (401/403/400) for each endpoint.

*** End Patch
  "category": { "id": 3, "name": "Burgers" },
  "available": true
}

## How to use it:
1.Build the Docker Image: Open your terminal in the project root and run:

docker build -t online-food-ordering .

2. Run the Container: Since your application depends on MySQL, ensure your database is accessible. If you are running MySQL on your host machine, you may need to update spring.datasource.url in application.properties to point to your host's IP or use a Docker network.

docker run -p 5454:5454 online-food-ordering


## Contributing
Contributions are welcome! Please fork the repository and submit pull requests for any improvements or bug fixes.

## Contact
For any queries or support, please contact Dimpi Singh at dimpisingh59@gmail.com.
