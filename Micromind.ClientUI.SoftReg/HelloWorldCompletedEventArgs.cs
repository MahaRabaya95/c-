using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;

namespace Micromind.ClientUI.SoftReg
{
	[GeneratedCode("System.Web.Services", "4.6.1590.0")]
	[DebuggerStepThrough]
	[DesignerCategory("code")]
	public class HelloWorldCompletedEventArgs : AsyncCompletedEventArgs
	{
		private object[] results;

		public string Result
		{
			get
			{
				RaiseExceptionIfNecessary();
				return (string)results[0];
			}
		}

		internal HelloWorldCompletedEventArgs(object[] results, Exception exception, bool cancelled, object userState)
			: base(exception, cancelled, userState)
		{
			this.results = results;
		}
	}
}
