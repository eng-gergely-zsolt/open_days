package com.sapientia.open.days.backend.security;

import com.mysql.cj.log.Log;
import com.sapientia.open.days.backend.io.repository.UserRepository;
import com.sapientia.open.days.backend.service.UserService;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@EnableWebSecurity
public class WebSecurity extends WebSecurityConfigurerAdapter {
    private final UserService userDetailsService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final UserRepository userRepository;

    public WebSecurity(UserService userDetailsService,
                       BCryptPasswordEncoder bCryptPasswordEncoder,
                       UserRepository userRepository) {
        this.userDetailsService = userDetailsService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.userRepository = userRepository;
    }

    // Needed to set some endpoints public and others protected.
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable().authorizeHttpRequests()
                .antMatchers(HttpMethod.POST, SecurityConstants.SIGN_UP_URL)
                .permitAll()
                .antMatchers(HttpMethod.GET, SecurityConstants.EMAIL_VERIFICATION_URL)
                .permitAll()
                .antMatchers(HttpMethod.POST, SecurityConstants.PASSWORD_RESET_REQUEST_URL)
                .permitAll()
                .antMatchers(HttpMethod.POST, SecurityConstants.PASSWORD_RESET_URL)
                .permitAll()
                .anyRequest().authenticated().and()
                .addFilter(getAuthenticationFilter())
                .addFilter(new AuthorizationFilter(authenticationManager(), userRepository))
                // Makes Spring to not create sessions -> Our REST API is stateless.
                // Prevents authorization headers to be cached.
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }

    // An encryption method to protect password. Spring security framework.
    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }

    // This function will change the endpoint name.
    public AuthenticationFilter getAuthenticationFilter() throws Exception {
        final AuthenticationFilter filter = new AuthenticationFilter(authenticationManager());
        filter.setFilterProcessesUrl("/users/login");
        return filter;
    }
}
