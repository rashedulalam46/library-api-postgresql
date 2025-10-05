using Library.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Library.Infrastructure.Data;

public class LibraryDbContext : DbContext
{
    public LibraryDbContext(DbContextOptions<LibraryDbContext> options)
        : base(options)
    {
    }

    // Example DbSet properties
    // public DbSet<Book> Books { get; set; }
    // public DbSet<Author> Authors { get; set; }

    public DbSet<Books> Books { get; set; }
    public DbSet<Authors> Authors { get; set; }
    public DbSet<Publishers> Publishers { get; set; }
    public DbSet<Categories> Categories { get; set; }
    public DbSet<Countries> Countries { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Set default schema if needed
        modelBuilder.HasDefaultSchema("library");

        // Convert all table names to lowercase
        foreach (var entity in modelBuilder.Model.GetEntityTypes())
        {
            entity.SetTableName(entity.GetTableName().ToLower());
        }

        base.OnModelCreating(modelBuilder);
    }
}