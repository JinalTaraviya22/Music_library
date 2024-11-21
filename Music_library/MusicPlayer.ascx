<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MusicPlayer.ascx.cs" Inherits="Music_library.MusicPlayer" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" href="css/MusicPlayerCss.css" /> <!-- Ensure this path is correct -->


<asp:HiddenField ID="hfCurrentSongTitle" runat="server" />
<asp:HiddenField ID="hfCurruntSongAudio" runat="server" />
<asp:HiddenField ID="hfCurrentSongId" runat="server" />


<div class="music-player">
    <div class="album-cover">
        <img src="song_img.png" alt="Album Cover" />
    </div>
    <div class="song-info">
        <div class="title">
            <asp:Label ID="songName" runat="server" Text=""></asp:Label></div>
        <div class="artist">Lil Nas X feat. Billy Ray Cyrus</div>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
        <div class="tooltip"></div>
    </div>
    <div class="controls">
        <i class="fas fa-backward"></i>
        <i class="fas fa-play" id="play-btn"></i>
        <i class="fas fa-forward"></i>
        <i class="fas fa-plus-circle" id="add-to-playlist"></i>
        <i class="fas fa-heart" id="like-btn"></i>
    </div>
</div>

<asp:Label ID="songAudio" runat="server" Text=""></asp:Label>
<%--<audio id="audio-song" src="Paris.mp3"></audio>--%>
<script src="js/MusicPlayerJs.js"></script>