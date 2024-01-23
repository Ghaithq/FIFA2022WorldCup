using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace DBProjectClone.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        public string UserAccount;
        public string UserType;
        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
            UserAccount = HttpContext.Session.GetString("Username");
            UserType = HttpContext.Session.GetString("UserType");
        }
    }
}