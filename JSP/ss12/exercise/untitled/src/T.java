import java.util.ArrayList;
import java.util.List;

public class T {
    public static void main(String[] args) {

        int[] p = {1, 4, 5, 2, 1};//sai
//        int[] p = {1,4,5,2,3};//1
//        int[] p = {1,4,5,2,3,2,3,8};//1
//        int[] p = {1,2,3};//1
//        int[] p = {1,2,1};//2
        int[] c= {1, 2, 3};
//        int[] c= {1, 1, 1};
//        int[] c= {1};
        boolean kq=true;
        int d=0;
        int max = 0;
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < c.length; i++) {
            d= 0;
            for (int j = 0; j < p.length; j++) {
                if (c[i]==p[j]) {
                    d++;
                    continue;
                }
            }
                list.add(d);
        }
        int min = list.get(0);
        for (Integer i: list){
            if (i<min) min = i;
        }

        System.out.println(min);
    }

//    public int solution(int[] parent, int[] child) {
//
//    }
}
