@IsTest
public class InstantTest {
	@IsTest
	public static void instantProvidesSystemDatetime() {
		Datetime datetimeNow = Datetime.now();
		Datetime instantNow = Instant.now();

		System.assert(datetimeNow.getTime() <= instantNow.getTime());
	}

	@IsTest
	public static void instantProvidesManualDatetime() {
		Datetime now = Datetime.now();
		Instant.setNow(now);

		System.assertEquals(Instant.now(), now);
	}

	@IsTest
	public static void instantProvidesSystemDate() {
		Date dateToday = Date.today();
		Date instantToday = Instant.today();

		System.assert(dateToday.daysBetween(instantToday) >= 0);
	}

	@IsTest
	public static void instantProvidesManualDate() {
		Date dateToday = Date.today();
		Instant.setToday(dateToday);

		System.assertEquals(Instant.today(), dateToday);
	}
}
