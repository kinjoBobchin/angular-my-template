import { FAVORITES } from './favorite-lists.mock';
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
