package ThreadJoining;

public class Main {

    public static void main(String[] args) throws InterruptedException {

        PlayerThread[] threads = new PlayerThread[4];

        /**
         * Creates and starts multiple player threads.
         *
         * @param threads An array of player threads
         */
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new PlayerThread(i + 1);
            threads[i].start();
        }

        // Joins the threads, main task will not be executed until the class threads
        // are executed
        for (PlayerThread playerThread : threads) {
            playerThread.join();
        }

        // Determine the player with the highest score
        int winningScore = 0;
        int winner = 0;
        for (int i = 0; i < threads.length; i++) {
            if (threads[i].getScore() > winningScore) {
                winningScore = threads[i].getScore();
                winner = i + 1;
            }
        }

        System.out.println("Player " + winner + " wins with a score of " + winningScore);

    }
}
