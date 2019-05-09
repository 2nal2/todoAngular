import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Todo } from '../models/todo';
import { Observable } from 'rxjs';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
}

@Injectable({
  providedIn: 'root'
})

export class TodoServiceService {
  url = 'https://jsonplaceholder.typicode.com/todos';

  constructor(private httpClient: HttpClient) { }

  getTodos(): Observable<Todo[]>{
    return this.httpClient.get<Todo[]>(this.url +'/' + '?_limit=5');
  }

  createTodo(todo: Todo): Observable<Todo>{
    return this.httpClient.post<Todo>(this.url, todo, httpOptions);
  }

  updateTodo(todo: Todo): Observable<any>{
    return this.httpClient.put(`${this.url}/${todo.id}`, todo, httpOptions);
  }

  deleteTodo(todo: Todo): Observable<Todo>{
    return this.httpClient.delete<Todo>(`${this.url}/${todo.id}`, httpOptions);
  }
}
