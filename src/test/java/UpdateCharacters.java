import com.intuit.karate.junit5.Karate;

public class UpdateCharacters {
    static {
        System.setProperty("karate.ssl", "true");
    }
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:update-characters.feature");
    }
}
