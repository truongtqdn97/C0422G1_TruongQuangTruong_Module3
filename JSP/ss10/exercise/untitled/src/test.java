
import java.util.*;

public class test {
    int[] solution(int[][] a) {
        int c;
        Set<Integer> list = new TreeSet<>();
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                c = 0;
                for (int k = 1; k <= a[i][j]; k++) {
                    if (a[i][j]%k==0) {
                        c++;
                    }
                }
                if (c==2){
                    list.add(a[i][j]);
                }
            }
        }
        int[] t = new int[list.size()];
        c = 0;
        for (Integer i: list){
            t[c] = i;
            c++;
        }
        return t;
    }
    public static void main(String[] args) {
        int[][] arr = {
                {1,2,8,43},
                {9,4,11,7},
                {11,6,4,0},
                {1,2,6,51}
        };


    }
}
