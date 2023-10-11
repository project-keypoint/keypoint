package com.keypoint.security;

import java.security.NoSuchAlgorithmException;

public class PasswordValidator {
    public static boolean isPasswordValid(String inputPassword, String salt, String storedPassword) throws NoSuchAlgorithmException {
        String hashedInputPassword = PasswordEncoder.encodePassword(inputPassword, salt);
        return hashedInputPassword.equals(storedPassword);
    }
}
