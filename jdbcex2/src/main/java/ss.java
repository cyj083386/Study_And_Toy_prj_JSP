import java.util.Scanner;

public class ss {
  public static void main(String[] args) {

    Scanner scanner = new Scanner(System.in);
    int rows = 0;

    while (true) {

      System.out.print("삼각형 출력 프로그램! 몇줄을 출력 하시겠습니까? (종료 0): ");
      String data = scanner.nextLine();
      rows = Integer.parseInt(data);

      if (rows == 0) {
        break;
      }

      for (int i = 0; i < rows; i++) {
        System.out.println(" ".repeat(rows - i - 1) + //삼각형이므로 i번째 행에서는 rows - i - 1만큼 앞에 공백을 입력
                "*".repeat(i * 2 + 1)); // 삼각형이므로 한줄의 너비는 (i * 2 + 1)임
      }
    }
  }
}
