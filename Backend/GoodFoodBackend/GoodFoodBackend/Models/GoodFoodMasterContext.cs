using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace GoodFoodBackend.Models
{
    public partial class GoodFoodMasterContext : DbContext
    {
        public GoodFoodMasterContext()
        {
        }

        public GoodFoodMasterContext(DbContextOptions<GoodFoodMasterContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Discount> Discount { get; set; }
        public virtual DbSet<Dish> Dish { get; set; }
        public virtual DbSet<Location> Location { get; set; }
        public virtual DbSet<Menu> Menu { get; set; }
        public virtual DbSet<Restaurant> Restaurant { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            { 
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=GoodFoodMaster;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.4-servicing-10062");

            modelBuilder.Entity<Discount>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Value).HasColumnType("numeric(4, 3)");

                entity.HasOne(d => d.Resteurant)
                    .WithMany(p => p.Discount)
                    .HasForeignKey(d => d.ResteurantId)
                    .HasConstraintName("FK_Discount_Restaurant");
            });

            modelBuilder.Entity<Dish>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Kcal).HasColumnType("numeric(8, 2)");

                entity.Property(e => e.Picture)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.Title)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.HasOne(d => d.Menu)
                    .WithMany(p => p.Dish)
                    .HasForeignKey(d => d.MenuId)
                    .HasConstraintName("FK_Dish_Menu");
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.City)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Number)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PostCode)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Street)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Menu>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.HasOne(d => d.Resteurant)
                    .WithMany(p => p.Menu)
                    .HasForeignKey(d => d.ResteurantId)
                    .HasConstraintName("FK_Menu_Restaurant");
            });

            modelBuilder.Entity<Restaurant>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.Restaurant)
                    .HasForeignKey<Restaurant>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Restaurant_Location");
            });
        }
    }
}
