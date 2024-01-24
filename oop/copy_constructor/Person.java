package copy_constructor;

import java.util.Arrays;

public class Person {
    String name;
    String nationality;
    String dateOfBirth;
    String[] passport;
    int seatNumber;

    public Person(String name, String nationality, String dateOfBirth, int seatNumber) {
        // set fields equal to parameters here.
        this.name = name;
        this.nationality = nationality;
        this.dateOfBirth = dateOfBirth;
        this.seatNumber = seatNumber;
        this.passport = new String[] { this.name, this.dateOfBirth, this.nationality };

    }
    // copy constructor

    public Person(Person src) {
        this.name = src.name;
        this.nationality = src.nationality;
        this.dateOfBirth = src.dateOfBirth;
        this.passport = src.passport;
        this.seatNumber = src.seatNumber;
    }

    public static void main(String[] args) {
        Person person = new Person("Rayan Slim", "Canadian", "01/01/1111", 5);

        Person twin = new Person(person);
        twin.name = "Jad Slim";
        twin.seatNumber = 4;

        System.out.println("The details about the person:");
        System.out.println(person.name);
        System.out.println(person.nationality);
        System.out.println(person.dateOfBirth);
        System.out.println(Arrays.toString(person.passport));
        System.out.println(person.seatNumber);

        System.out.println("The details about the person:");
        System.out.println(twin.name);
        System.out.println(twin.nationality);
        System.out.println(twin.dateOfBirth);
        System.out.println(Arrays.toString(twin.passport));
        System.out.println(twin.seatNumber);

    }
}
