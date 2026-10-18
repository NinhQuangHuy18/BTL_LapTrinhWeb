namespace BTL_LapTrinhWeb.Models
{
    public class ProductListViewModel
    {
        public List<SanPham> Products { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public int TotalItems { get; set; }
        public string SortOrder { get; set; }
    }
}
