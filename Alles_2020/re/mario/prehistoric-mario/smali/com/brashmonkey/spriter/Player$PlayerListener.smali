.class public interface abstract Lcom/brashmonkey/spriter/Player$PlayerListener;
.super Ljava/lang/Object;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PlayerListener"
.end annotation


# virtual methods
.method public abstract animationChanged(Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Animation;)V
.end method

.method public abstract animationFinished(Lcom/brashmonkey/spriter/Animation;)V
.end method

.method public abstract mainlineKeyChanged(Lcom/brashmonkey/spriter/Mainline$Key;Lcom/brashmonkey/spriter/Mainline$Key;)V
.end method

.method public abstract postProcess(Lcom/brashmonkey/spriter/Player;)V
.end method

.method public abstract preProcess(Lcom/brashmonkey/spriter/Player;)V
.end method
