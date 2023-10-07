
public aspect TraceAspect_Haynes {

    pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

    pointcut getNameMethod(): classToTrace() && execution(* *.getName());

    Object around(): getNameMethod() {
        System.out.println("  [BGN] " + thisJoinPointStaticPart.getSignature() + ", " + thisJoinPointStaticPart.getSourceLocation().getLine());
        Object result = proceed();
        System.out.println("  [END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
        return result;
    }
}
