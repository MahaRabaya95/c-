namespace Micromind.Utilities.Zip.Compression
{
	public class DeflaterPending : PendingBuffer
	{
		public DeflaterPending()
			: base(65536)
		{
		}
	}
}
