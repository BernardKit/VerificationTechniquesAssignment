

package rv;

import assertion.Assertion;
import fits.UserInfo;
import fits.UserSession;
import java.util.HashMap;






public aspect Properties {
static void setupVerification() {
initialisehasTriggered3346d();initialisestate3346d();initialisecount();
}

static HashMap<UserInfo, Boolean> hasTriggered3346d = new HashMap<UserInfo, Boolean>();
static void initialisehasTriggered3346d(){hasTriggered3346d= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, String> state3346d = new HashMap<UserInfo, String>();
static void initialisestate3346d(){state3346d= new HashMap<UserInfo, String>(); }


static HashMap<UserInfo, Integer> count = new HashMap<UserInfo, Integer>();
static void initialisecount(){count= new HashMap<UserInfo, Integer>(); }



before (UserInfo u): call(* UserInfo.makeGreylisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Normal") && (true)) {
{}state3346d.put(u,"Greylisted");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeWhitelisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Greylisted") && (true)) {
{count.put(u,0);}state3346d.put(u,"Probation");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeBlacklisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Greylisted") && (true)) {
{}state3346d.put(u,"Normal");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.depositTo(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Probation") && (count.computeIfAbsent(u, (k) -> 0) < 2)) {
{count.put(u,count.computeIfAbsent(u, (k) -> 0) + 1);}state3346d.put(u,"Probation");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.depositTo(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Probation") && (count.computeIfAbsent(u, (k) -> 0) >= 2)) {
{count.put(u,count.computeIfAbsent(u, (k) -> 0) + 1);}state3346d.put(u,"Normal");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeGreylisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Probation") && (true)) {
{}state3346d.put(u,"Greylisted");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeBlacklisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Probation") && (true)) {
{}state3346d.put(u,"Normal");hasTriggered3346d.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.withdrawFrom(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered3346d.computeIfAbsent(u, (k) -> false) && state3346d.computeIfAbsent(u, (k) -> "Normal").equals("Probation") && (true)) {
{}state3346d.put(u,"Bad");hasTriggered3346d.put(u,true);System.out.println("Probation violated: withdrawal before completing 3 deposits");}
  }


before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggered3346d = new HashMap<UserInfo,Boolean> ();}
  }

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggered3346d = new HashMap<UserInfo,Boolean> (); }
  }

}