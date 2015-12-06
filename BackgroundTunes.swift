//
//  ViewController.swift
//  IronTunes
//
//  Created by Michael Reynolds on 10/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class NowPlayingViewController: UIViewController
{
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumArtwork: UIImageView!

    @IBOutlet var playPauseButton: UIButton!
    
    let avQueuePlayer = AVQueuePlayer()
    var songs = Array<Song>()
    var currentSong: Song?
    var nowPlaying: Bool = false
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupAudioSession()
        configurePlaylist()
        loadCurrentSong()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - Action Handlers
    
    @IBAction func playPauseTapped(sender: UIButton)
    {
        togglePlayback(!nowPlaying)
    }
    
    @IBAction func skipForwardTapped(sender: UIButton)
    {
        let currentSongIndex = (songs as NSArray).indexOfObject(currentSong!)
        let nextSong: Int
        
        if currentSongIndex + 1 >= songs.count
        {
            nextSong = 0
        }
        else
        {
            nextSong = currentSongIndex + 1
        }
        currentSong = songs[nextSong]
        loadCurrentSong()
        togglePlayback(true)
    }
    
    @IBAction func skipBackTapped(sender: UIButton)
    {
        avQueuePlayer.seekToTime(CMTimeMakeWithSeconds(0.0, 1))
        if !nowPlaying
        {
            togglePlayback(true)
        }
    }
    
    //MARK: - Audio
    
    func setupAudioSession()
    {
        AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
            if granted
            {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                }
                catch _ {
                }
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                }
                catch _ {
                    
                }
            }
            else
            {
                    print("Audio session could not be configured: user denied permission")
            }
        })
        
    }
    
    func configurePlaylist()
    {
        let acoustic = Song(title: "Happiness", artist: "Benjamin Tissot", filename: "happiness", albumArtwork: "Acoustic")
        songs.append(acoustic)
        currentSong = acoustic
        
        let dubstep = Song(title: "Dubstep", artist: "Benjamin Tissot", filename: "dubstep", albumArtwork: "DubStep")
        songs.append(dubstep)
        
        let hiphop = Song(title: "Groovy Hip Hop", artist: "Benjamin Tissot", filename: "groovyhiphop", albumArtwork: "HipHop")
        songs.append(hiphop)
        
        let rock = Song(title: "Actionable", artist: "Benjamin Tissot", filename: "actionable", albumArtwork: "Rock")
        songs.append(rock)
        
        let funk = Song(title: "Funky Suspense", artist: "Benjamin Tissot", filename: "funkysuspense", albumArtwork: "Funk")
        songs.append(funk)
        
    }
    
    func loadCurrentSong()
    {
        avQueuePlayer.removeAllItems()
        if let song = currentSong
        {
            song.playerItem.seekToTime(CMTimeMakeWithSeconds(0.0, 1))
            avQueuePlayer.insertItem(song.playerItem, afterItem: nil)
            songTitleLabel.text = song.title
            artistLabel.text = song.artist
            albumArtwork.image = UIImage(named: song.albumArtworkName)
        }
    }

    func togglePlayback(play: Bool)
    {
        nowPlaying = play
        if play
        {
            playPauseButton.setImage(UIImage(named: "Pause"), forState: UIControlState.Normal)
            avQueuePlayer.play()
        }
        else
        {
            playPauseButton.setImage(UIImage(named: "Play"), forState: UIControlState.Normal)
            avQueuePlayer.pause()
        }
    }
}

