# Apex Utilities

## Classes

- [`ApexString`](#apex-string)
- [`Instant`](#instant)
- [`Optional`](#optional)

## `ApexString`
<a name="apex-string"></a>

`ApexString` is a case-insensitive `String`, which makes it possible to use collections which behave consistently with `==` operator on `String`.

```java
ApexString a = 'test';
ApexString b = 'tEsT';
Boolean isOperatorEqual = a == b; // true
Boolean isEqualsEqual = a.equals(b); // *true*, unlike regular String

Set<ApexString> stringSet = new Set<ApexString>();
stringSet.add(a);
stringSet.add(b);

System.assertEquals(1, stringSet.size()); // contains just a *single* case-insensitive element, unlike regular String!
System.assert(stringSet.contains(a)); // true
System.assert(stringSet.contains(b)); // true
```

| Modifier and type | Method | Description |
|-------------------|--------|-------------|
| `static ApexString` | `of(String str)` | Returns a case-insensitive `ApexString` |
| `static List<ApexString>` | `listOf(Iterable<String> strings)` | Returns a `List<ApexString>` which contains all strings from provided iterable |
| `static List<ApexString>` | `listOf(Set<String> strings)` | Returns a `List<ApexString>` which contains all strings from provided set |
| `static Set<ApexString>` | `setOf(Iterable<String> strings)` | Returns a `Set<ApexString>` which contains all strings from provided iterable |
| `static Set<ApexString>` | `setOf(Set<String> strings)` | Returns a `Set<ApexString>` which contains all strings from provided set |
| `static String` | `join(Iterable<ApexString> strings, String separator)` | Joins the `strings` with `separator` and returns the resulting `String` |
| `static String` | `join(Set<ApexString> strings, String separator)` | Joins the `strings` with `separator` and returns the resulting `String` |

### Warning :warning:

`System.String.join` does not use the `toString` method on objects it is joining. All `ApexString` instances are therefore stringified to `'ApexString'` before they are joined into the final string (for example `'ApexString,ApexString,ApexString'`). To join collections of `ApexString`, use `ApexString.join` instead.

## `Instant`
<a name="instant"></a>

`Instant` enables mocking dates and datetimes in tests for classes with temporal logic, by providing `Datetime.now()` and `Date.today()` replacements. This is helpful when `Date` and `Datetime` injection is not possible or convenient.

```java
public class TemporalExample {
    public static String timestamp() {
        return Datetime.now().format('yyyy-MM-dd\'T\'HH:mm:ss'); // relies on current datetime provided by System.Datetime
    }
    
    public static String testableTimestamp() {
        return Instant.now().format('yyyy-MM-dd\'T\'HH:mm:ss'); // defaults to current datetime, but can be overriden in test
    }
}

@IsTest
public TemporalExampleTest {
    @IsTest
    public static void testTimestamp() {
        String currentTimestamp = TemporalExample.timestamp(); // output is untestable
    }
    
    @IsTest
    public static void testTestableTimestamp() {
        Datetime mockDatetime = Datetime.newInstance(2000, 1, 15, 10, 30, 59);
        Instant.setNow(mockDatetime);
        String timestamp = TemporalExample.testableTimestamp();
        System.assertEquals(timestamp, '2000-01-15T10:30:59');
    }
}
```


## `Optional`
<a name="optional"></a>

`Optional` simplifies operations with values which can be `null`.

| Modifier and type | Method | Description |
|-------------------|--------|-------------|
| `static Optional` | `of(Object value)` | Returns an `Optional` that wraps the provided value if it’s non-null. Throws a `LambdaException` exception otherwise |
| `static Optional` | `ofNullable(Object value)` | Returns an `Optional` that wraps the provided value if it’s non-null. Returns an empty `Optional` otherwise |
| `static Optional` | `empty()` | Returns an empty `Optional` |
| `Object` | `get()` | Returns a value if it’s present. Throws a `LambdaException` otherwise |
| `Boolean` | `isPresent()` | Returns whether the value is present.
| `Object` | `orElse(Object other)` | Returns the value if it’s present, and provided `other` otherwise |
