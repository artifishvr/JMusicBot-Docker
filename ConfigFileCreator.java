import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class ConfigFileCreator {

    public static void main(String[] args) {
        // Read environment variables
        String token = System.getenv("TOKEN");
        String owner = System.getenv("OWNER");
        String prefix = System.getenv("PREFIX");

        // Template for config.txt
        String template = "/////////////////////////////////////////////////////////\n" +
                "// Config for the JMusicBot                            //\n" +
                "/////////////////////////////////////////////////////////\n" +
                "// Any line starting with // is ignored                //\n" +
                "// You MUST set the token and owner                    //\n" +
                "// All other items have defaults if you don't set them //\n" +
                "/////////////////////////////////////////////////////////\n" +
                "token = %s\n" +
                "owner = %s\n" +
                "prefix = \"%s\"\n";

        // Replace the placeholders in the template with environment variable values
        String configFileContent = String.format(template, token, owner, prefix);

        // Write config.txt file
        System.out.println("Creating config.txt file...");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("config.txt"))) {
            writer.write(configFileContent);
        } catch (IOException e) {
            System.out.println("Failed to create config.txt file: " + e.getMessage());
            return;
        }

        // Start JMusicBot-0.3.9.jar
        try {
            Process process = Runtime.getRuntime().exec("java -jar JMusicBot-0.3.9.jar");
            System.out.println("#####################");
            System.out.println("JMusicBot started!");
            System.out.println("#####################");
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            System.out.println("Failed to start JMusicBot: " + e.getMessage());
        }
    }
}
