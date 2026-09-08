package org.example.libis;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Book {
    private int bookId;
    private String title;
    private String author;
    private String genre;
    private String synopsis;
    private boolean available;

//    public boolean isAvailable(){
//        return available;
//    }
}
