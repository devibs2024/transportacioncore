namespace TransportationCore.Data.Interfaces
{
    public interface ISoftDeleteService
    {
        Task SoftDelete<TEntity>(params object[] keyValues) where TEntity : class, ISoftDeletable;
    }

}
