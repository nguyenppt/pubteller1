//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BankProject.DBContext
{
    using System;
    using System.Collections.Generic;
    
    public partial class Shifts
    {
        public Shifts()
        {
            this.AccountPeriods = new HashSet<AccountPeriods>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public System.DateTime BeginShift { get; set; }
        public System.DateTime EndShift { get; set; }
    
        public virtual ICollection<AccountPeriods> AccountPeriods { get; set; }
    }
}
