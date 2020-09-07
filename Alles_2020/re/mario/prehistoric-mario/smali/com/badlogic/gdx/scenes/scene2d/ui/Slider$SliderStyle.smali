.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Slider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SliderStyle"
.end annotation


# instance fields
.field public knobDown:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

.field public knobOver:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 200
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;)V
    .locals 1

    .line 208
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V

    .line 209
    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;->knobOver:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;->knobOver:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 210
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;->knobDown:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Slider$SliderStyle;->knobDown:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V
    .locals 0

    .line 204
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    return-void
.end method
