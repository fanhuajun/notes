package cn.com.thit.sso.util;

import java.security.SecureRandom;

public class RandomSsoUtils {

    public static SecureRandom random;

    public static SecureRandom getRandom() {
        try {
            if(random == null){
                random = SecureRandom.getInstance("SHA1PRNG");
            }
            return random;

        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    public static void main(String[] args) {
//        int t = RandomSsoUtils.getRandom().nextInt(122);
        int t = (int) (Math.random() * 122);
        System.out.println("随机数据="+t);

    }

    public static int randomOld(){

        int t = (int) (Math.random() * 122);
        return t;
    }

}
