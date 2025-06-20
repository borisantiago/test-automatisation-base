import com.intuit.karate.junit5.Karate;

public class PostCharacters {
    static {
        System.setProperty("karate.ssl", "true");
    }
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:post-create-characters.feature");
    }
}
