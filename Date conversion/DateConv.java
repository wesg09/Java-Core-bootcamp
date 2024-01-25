import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConv {
    public static void main(String[] args) {
        /**
         * Creates a new instance of the Date class, representing the current date and
         * time.
         *
         * @return A new Date object representing the current date and time.
         */
        Date date = new Date();
        /**
         * The format string for formatting a date in the format "MMM dd yyyy".
         */
        String format = "MMM dd yyyy";
        // String format = "dd-MM-yy"; // can use different formats

        /**
         * Creates a new instance of SimpleDateFormat with the specified format pattern.
         *
         * @param format The format pattern to be used for date and time formatting.
         * @return A new instance of SimpleDateFormat with the specified format pattern.
         */
        SimpleDateFormat sdFormat = new SimpleDateFormat(format);

        /**
         * Formats the given date object into a string representation using the
         * specified date format.
         *
         * @param date The date object to be formatted
         * @return The formatted date string
         */
        String dateFormatted = sdFormat.format(date);
        System.out.println(dateFormatted);
    }
}