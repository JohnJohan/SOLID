public class LSPTest {
    static AbstractQueue<MyDataClass> q = 
            new ArrayBlockingQueue(100);
            //new DelayQueue();
    
    public static void main(String[] args) throws Exception {
        for ( int i = 0; i < 10; i++ ) {
            q.add( getData(i+1) );
        }

        MyDataClass first = q.element();
        System.out.println("First element data: " +first.val3);
        
        int i = 0;
        for ( MyDataClass data: q ) {
            if ( i++ == 0 ) {
                test(data, first);
            }

            System.out.println("Data element: " + data.val3);
        }
        
        MyDataClass data = q.peek();
        test(data, first);
        int elements = q.size();
        data = q.remove();
        test(data, first);
        if ( q.size() != elements-1 ) {
            throw new Exception("Failed LSP test!");
        }
        
        q.clear();
        if ( ! q.isEmpty() ) {
            throw new Exception("Failed LSP test!");
        }
    }
    
    public static MyDataClass getData(int i) {
        Random rand = new Random(i); 
        MyDataClass data = new MyDataClass();
        data.val1 = rand.nextInt(100000);
        data.val2 = rand.nextLong(100000);
        data.val3 = ""+data.val1+data.val2;
        return data;
    }
    
    public static void test(MyDataClass d1, MyDataClass d2) throws Exception{
        if ( ! d1.val3.equals(d2.val3) ) {
            throw new Exception("Failed LSP test!");
        }
    }
}
