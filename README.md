# Shell-Movie-Recording-Gif-Converting
This simple shell bash script offers two functions to help you record video from iOS simulator &amp; convert it easily to GIF. If you don't need to record video from iOS simulator, the second function will be still useful for converting any video file to GIFs. (.MP4 .MOV etc)


## Prerequisites
#### Simulator Recording 
- Xcode Command Line Tools (This can be turned on by going to **Xcode->Preferences->Locations**, then choose **Command Line Tools Location** with your Xcode version.)
#### GIF Converting
- ffmpeg (for video converting) (To install, use ```brew install ffmpeg```)
- gifsicle (for GIF optimization) (To install, use ```brew install gifsicle```)


## Usage
I recommend you copy and paste these two functions into your ```.bash_profile``` under your ```~/``` directly, so that your can just use it directly without run the shell bash. If you do that, you can simply do:
#### Simulator Recording
```
$ rv               # video will be stored in desktop named in.mov  
$ rv <video-name>  # video will be stored in desktop named video-name.mov 
```
You can use ctrl+C to stop recording.

#### GIF Converting
```
$ cg
$ cg -h  # for usage
$ cg -s  # start time, default 00:00:00, watch format
$ cg -t  # end time, default null, watch format
$ cg -n  # input video name, default in.mov
$ cg -st # <1|2>, 1, for iPhone7, 2 for iPhoneX, default 1
$ cg -r  # frame rate, default 8, use frame rate to adjust output file size
```
All input options are not required and can exist at the same time. You might need to modify converting scale if you want different aspect ratios, I was more focused on iPhone screens.
