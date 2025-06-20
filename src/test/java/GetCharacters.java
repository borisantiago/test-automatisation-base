import com.intuit.karate.junit5.Karate;

public class GetCharacters {
    static {
        System.setProperty("karate.ssl", "true");
    }
    @Karate.Test
    Karate getCharacters() {
        return Karate.run("classpath:get-characters.feature");
    }

    @Karate.Test
    Karate postCharacter() {
        return Karate.run("classpath:post-create-characters.feature");
    }


}
