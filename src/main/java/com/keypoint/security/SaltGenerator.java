package com.keypoint.security;

import org.apache.commons.codec.binary.Base64;
import java.security.SecureRandom;

public class SaltGenerator {
	public static String generateSalt() {
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		System.out.println(Base64.encodeBase64String(salt));
		return Base64.encodeBase64String(salt);
	}

	public static String getSalt() {
		return generateSalt();
	}
}
