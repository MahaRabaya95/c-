using System.Net;
using System.Security.Cryptography.X509Certificates;

namespace Micromind.Utilities.AppUpdater
{
	public class TrustAllCertificatePolicy : ICertificatePolicy
	{
		public bool CheckValidationResult(ServicePoint sp, X509Certificate cert, WebRequest req, int problem)
		{
			return true;
		}
	}
}
