# Library API — PostgreSQL

A simple .NET Core Web API for managing a library system, backed by PostgreSQL as the database.  
This project is structured with clean architecture (Domain, Application, Infrastructure, API) and supports basic CRUD operations on books, authors, categories, publishers, etc.

---

## 📁 Repository Structure
```
LibraryApiPostgreSql/
├── Library.Api/                   # API / presentation layer (controllers, endpoints)
├── Library.Application/           # Application logic
│   ├── Services/                  # Business services / use cases
│   └── DTOs/                      # Data Transfer Objects, ViewModels
├── Library.Domain/                # Domain / core (entities, interfaces)
├── Library.Infrastructure/        # Data access, repository implementations, EF Core, DB context
├── LibraryApiSqlServer.sln
├── Program.cs
├── appsettings.json
├── appsettings.Development.json
└── README.md
```

---

## ⚙️ Prerequisites

- [.NET 9 SDK](https://dotnet.microsoft.com/download) or compatible .NET version  
- [PostgreSQL] installed and running  
- A database user and database created (or ability to create)  
- (Optional) A tool for API testing, like Postman or HTTPie  

---

## 🔧 Setup / Getting Started

**1. Clone the repository**

```bash
  git clone https://github.com/rashedulalam46/library-api-postgresql.git
  cd library-api-postgresql
```

**2. Configure connection string**
   
Open appsettings.json or appsettings.Development.json, and set up your ConnectionStrings:ConString to point to your PostgreSQL.

```
{
  "ConnectionStrings": {
   "ConString": "Host=localhost;Port=5432;Database=librarydb;Username=youruser;Password=yourpassword"   
  }
}
```

If you are using Docker, then use

```
{
  "ConnectionStrings": {
    "ConString": "Server=host.docker.internal;Database=LibraryDb;User Id=…;Password=…;"
  }
}
```

**3. Create a new PostgreSQL database**
```
CREATE DATABASE librarydb;
```

Create all the necessary tables.

**4. Build & run the API**

```
dotnet build
dotnet run
```

The default launch URL might be https://localhost:5177/api (or as configured). Use a tool like Postman, curl, or HTTPie to test the endpoints.

## 🛣️ API Endpoints (Examples)

These are sample endpoints — adjust according to actual implementation.
| Method | URL             | Description             |
| ------ | --------------- | ----------------------- |
| GET    | /api/books      | Get all books           |
| GET    | /api/books/{id} | Get book by ID          |
| POST   | /api/books      | Create a new book       |
| PUT    | /api/books/{id} | Update an existing book |
| DELETE | /api/books/{id} | Delete a book by ID     |

## ✅ Features & Highlights

- Clean / layered architecture (Domain, Application, Infrastructure, Presentation)
- Dependency Injection
- EF Core as data access layer
- DTOs / ViewModels for input/output
- Configuration-based connection strings
- Exception handling, validation, etc.

 ## 📦 Deployment

When you’re ready to deploy:

- Configure the production connection string in environment variables.
- Publish the project:

```
dotnet publish --configuration Release
```

- Deploy the resulting output to your server / host / container.
- Ensure the database is accessible and migrations are applied.

##  📄 License & Contribution

- Feel free to fork or suggest changes via pull requests.
- Add a LICENSE file if you have specific usage terms.
- Please document style, code conventions, etc., in a CONTRIBUTING.md.






