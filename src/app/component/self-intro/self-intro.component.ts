import { Component, OnInit } from '@angular/core';
import { introData } from './self-intro.mock';

@Component({
  selector: 'app-self-intro',
  templateUrl: './self-intro.component.pug',
  styleUrls: ['./self-intro.component.sass']
})
export class SelfIntroComponent implements OnInit {

  constructor() {}

  selfData = introData;

  ngOnInit() {
  }

}
