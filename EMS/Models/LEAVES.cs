//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EMS
{
    using System;
    using System.Collections.Generic;
    
    public partial class LEAVES
    {
        public int LeaveId { get; set; }
        public string EmployeeId { get; set; }
        public int SupervisorId { get; set; }
        public int LeavetypeId { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime LastDate { get; set; }
        public double NumberOfDays { get; set; }
        public string LeaveStatus { get; set; }
        public string Description { get; set; }
    }
}
