#include "HelloWorld.h"  
#include <stdio.h>  
#include <jni.h>  
/* 
 * Class:     HelloWorld 
 * Method:    displayHelloWorld 
 * Signature: ()V 
 */  
JNIEXPORT void JNICALL Java_HelloWorld_displayHelloWorld  
  (JNIEnv *, jobject)  
 {  
    printf("Hello World!\n");  
    return;  
}  