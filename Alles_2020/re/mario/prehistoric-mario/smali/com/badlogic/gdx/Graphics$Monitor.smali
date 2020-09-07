.class public Lcom/badlogic/gdx/Graphics$Monitor;
.super Ljava/lang/Object;
.source "Graphics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/Graphics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Monitor"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final virtualX:I

.field public final virtualY:I


# direct methods
.method protected constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput p1, p0, Lcom/badlogic/gdx/Graphics$Monitor;->virtualX:I

    .line 92
    iput p2, p0, Lcom/badlogic/gdx/Graphics$Monitor;->virtualY:I

    .line 93
    iput-object p3, p0, Lcom/badlogic/gdx/Graphics$Monitor;->name:Ljava/lang/String;

    return-void
.end method
