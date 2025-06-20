import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
    }

    @Karate.Test
    Karate testBasic() {
        return Karate.run(
                "karate-test.feature",
                "post-create-characters.feature",
                "get-characters.feature",
                "update-characters.feature",
                "delete-characters.feature"
        ).relativeTo(getClass());
    }

}
