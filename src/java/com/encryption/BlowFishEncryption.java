/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.encryption;
import javax.crypto.spec.*;
import java.security.*;
import javax.crypto.*;
import sun.misc.BASE64Encoder;
/**
 *
 * @author Acer
 */
public class BlowFishEncryption {
    
  public static String encrypt(byte[] toEncrypt, String key) throws Exception {
     String cipherText=null;
      // create a binary key from the argument key (seed)
      SecureRandom sr = new SecureRandom(key.getBytes());
      KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
      kg.init(sr);
      SecretKey sk = kg.generateKey();
  
      // create an instance of cipher
      Cipher cipher = Cipher.getInstance("Blowfish");
  
      // initialize the cipher with the key
      cipher.init(Cipher.ENCRYPT_MODE, sk);
  
      // enctypt!
      byte[] encrypted = cipher.doFinal(toEncrypt);
   cipherText = new BASE64Encoder().encode(encrypted);
      return cipherText;
   }  
}
