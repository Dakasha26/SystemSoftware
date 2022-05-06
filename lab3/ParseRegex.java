import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class ParseRegex {
    public void parse() {
        String exp = "y=AB";

        Pattern pattern = Pattern.compile("(y)=(([A-Z])([A-Z]))");
        Matcher matcher = pattern.matcher(exp);
        matcher.find();

        for (int i = 0; i <= matcher.groupCount(); i++)
            if (!matcher.group(i).trim().isEmpty())
                System.out.println(i + "---" + matcher.group(i));
    }
}

