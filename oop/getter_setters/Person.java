package getter_setters;

import java.util.Arrays;

public class Person {
    private String name;
    private String nationality;
    private String dateOfBirth;
    private String[] passport;
    private int seatNumber;

    public Person(String name, String nationality, String dateOfBirth, int seatNumber) {
        // set fields equal to parameters here.
        this.name = name;
        this.nationality = nationality;
        this.dateOfBirth = dateOfBirth;
        this.seatNumber = seatNumber;
        this.passport = new String[] { this.name, this.dateOfBirth, this.nationality };

    }

    // Getters and setters
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationality() {
        return this.nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getDateOfBirth() {
        return this.dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String[] getPassport() {
        return this.passport;
    }

    public int getSeatNumber() {
        return this.seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public static void main(String[] args) {
        Person person = new Person("rohan", "Indian", "01-01-2002", 100);

        // Print details using getters
        System.out.println("Person details:");
        System.out.println(person.getName());
        System.out.println(person.getNationality());
        System.out.println(person.getDateOfBirth());
        System.out.println(Arrays.toString(person.getPassport()));
        System.out.println(person.getSeatNumber());

        // updating seat number

        person.seatNumber = 90;

        System.out.println("Person details:");
        System.out.println(person.getName());
        System.out.println(person.getNationality());
        System.out.println(person.getDateOfBirth());
        System.out.println(Arrays.toString(person.getPassport()));
        System.out.println(person.getSeatNumber());

    }

}
