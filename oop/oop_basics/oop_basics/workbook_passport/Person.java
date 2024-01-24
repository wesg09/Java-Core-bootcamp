public class Person {

    private String name;
    private String nationality;
    private String dateOfBirth;
    private String[] passport;
    private int seatNumber;

    public Person(String name, String nationality, String dateOfBirth, int seatNumber) {
        this.name = name;
        this.nationality = nationality;
        this.dateOfBirth = dateOfBirth;
        this.seatNumber = seatNumber;
    }

    public Person(Person source) {
        this.name = source.name;
        this.nationality = source.nationality;
        this.dateOfBirth = source.dateOfBirth;
        this.seatNumber = source.seatNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public boolean applypassport() {
        int number = (int) (Math.random() * 2); // random int that can be 0 or 1.
        return (number == 1) ? true : false;
    }

    public void chooseseat() {
        int seat = (int) (Math.random() * 11 + 1);
        this.seatNumber = seat;
    }

    public static void main(String[] args) {
        Person person = new Person("Rayan Slim", "Canadian", "01/01/1111", 5);

        if (person.applypassport()) {
            System.out.println("Congratulations " + person.getName() + ". Your passport was approved!");
            person.chooseseat();
        } else {
            System.out.println("We are sorry " + person.getName() + ". We cannot process your application.");
        }

        System.out.println("The details about the person:");
        System.out.println(person.name);
        System.out.println(person.nationality);
        System.out.println(person.dateOfBirth);
        System.out.println(person.seatNumber);

    }

}
