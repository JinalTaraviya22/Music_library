<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="currentPlaying.ascx.cs" Inherits="Music_library.currentPlaying" %>

<div id="currentlyPlaying" class="currently-playing" style="display: <%# IsSongPlaying() ? "block" : "none" %>;">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h5>Currently Playing:</h5>
                <p>
                    <asp:Label ID="lblCurrentSong" runat="server"></asp:Label>
                </p>
                <audio controls>
                    <source id="audioSource" runat="server" src="" type="audio/mpeg" />
                    Your browser does not support the audio element.
                </audio>
            </div>
        </div>
    </div>
</div>