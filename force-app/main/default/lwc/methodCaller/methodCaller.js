import { LightningElement } from 'lwc';

export default class MethodCaller extends LightningElement {
    videoURL = "https://www.youtube.com/watch?v=e5CrrBwesd4";

    handlePlay() {
        this.template.querySelector('c-video-player').play();
    }

    handlePause() {
        this.template.querySelector('c-video-player').pause();
    }
}