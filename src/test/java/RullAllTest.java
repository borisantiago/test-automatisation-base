import com.intuit.karate.junit5.Karate;

public class RullAllTest {
    @Karate.Test
    Karate test() {
        return Karate.run(
                "karate-test.feature",
                "post-create-characters.feature",
                "get-characters.feature",
                "update-characters.feature",
                "delete-characters.feature"
        ).relativeTo(getClass());
    }

}
