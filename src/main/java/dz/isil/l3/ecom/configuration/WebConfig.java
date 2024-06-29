package dz.isil.l3.ecom.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
//@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    private static final String[] CLASSPATH_RESOURCE_LOCATIONS =
            {
                    "classpath:/**",
                    "classpath:/static",
                    "classpath:/static/css",
                    "classpath:/static/bootstrap/**",
                    "classpath:/static/bootstrap-icons-1.11.3",
                    "classpath:/static/images",

            };


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/**").addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
    }


}
