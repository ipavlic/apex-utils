public class Instant {

	private static Datetime now;
	private static Date today;

	@TestVisible
	public static void setNow(Datetime now) {
		Instant.now = now;
	}

	@TestVisible
	public static void setToday(Date today) {
		Instant.today = today;
	}

	public static Datetime now() {
		return Instant.now != null ? Instant.now : Datetime.now();
	}

	public static Date today() {
		return Instant.today != null ? Instant.today : Date.today();
	}
}
