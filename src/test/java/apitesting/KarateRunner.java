package apitesting;

import com.intuit.karate.junit5.Karate;

class KarateRunner {

    @Karate.Test
    Karate ejecucionFujo() {
        return Karate.run("classpath:feature/jsonplaceholder.feature");
    }

}