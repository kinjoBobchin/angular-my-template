import { FAVORITES } from './favorite-mock-lists';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-favorite-lists',
  templateUrl: './favorite-lists.component.pug',
  styleUrls: ['./favorite-lists.component.sass']
})
export class FavoriteListsComponent implements OnInit {
  favorites = FAVORITES;

  constructor() {}

  ngOnInit() {}
}
