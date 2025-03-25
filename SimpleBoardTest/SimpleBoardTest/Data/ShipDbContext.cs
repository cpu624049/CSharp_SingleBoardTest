using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace SimpleBoardTest.Data
{
    public class ShipDbContext : DbContext
    {
        public ShipDbContext() {}
        public ShipDbContext(DbContextOptions<ShipDbContext> options)
            : base(options)
        {
        }

        public DBSet
    }
}
