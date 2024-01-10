namespace TransportationCore.Data.Dtos.UserAccount
{
    public class AuthenticationResponseDto
    {
        public string Token { get; set; }
        public DateTime ExpirationDate { get; set; }
    }
}
