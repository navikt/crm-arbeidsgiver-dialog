public with sharing class TAG_UpdExternalIdOnThreadsScheduler implements Schedulable {
    public void execute(SchedulableContext SC) {
            TAG_UpdExternalIdOnThreads batch = new TAG_UpdExternalIdOnThreads();
            Database.executeBatch(batch, 200);
    }
}