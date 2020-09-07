.class public interface abstract Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;
.super Ljava/lang/Object;
.source "GLErrorListener.java"


# static fields
.field public static final LOGGING_LISTENER:Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;

.field public static final THROWING_LISTENER:Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener$1;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener$1;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;->LOGGING_LISTENER:Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;

    .line 64
    new-instance v0, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener$2;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener$2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;->THROWING_LISTENER:Lcom/badlogic/gdx/graphics/profiling/GLErrorListener;

    return-void
.end method


# virtual methods
.method public abstract onError(I)V
.end method
