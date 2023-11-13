package common;


public class Person {
  private String name;
  private int age;

  //alt insert -> constructor 필드 잡음
  public Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
  // alt insert -> constructor 위에만 잡음
  public Person() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }
}
