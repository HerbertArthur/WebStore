package com.webstore.utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 *  基于POI浏览行为的协同过滤  ItemCF
 *
 */
public class ShopFPGrowth {

    // 设定最小支持频次为1
    public static final int  support = 1;
    private static final String ITEM_SPLIT = ";";
    // 置信度阈值
    private final static double CONFIDENCE = 3;
    public Map<String, Integer> frequentCollectionMap = new HashMap();
    public Map<Map<String, String>, Double> rules = new HashMap();
    public Map<String, Integer> oneCount = new HashMap();
    private StringBuilder builder = new StringBuilder();
    //保存第一次的次序
    public Map<String, Integer> ordermap = new HashMap();
    //出‘数据
    private LinkedList<LinkedList<String>> totalRecords;

    public ShopFPGrowth(LinkedList<LinkedList<String>> records){
        this.totalRecords = records;
        count();
    }

    public LinkedList<LinkedList<String>> readF1() throws IOException {
//        String filePath="scripts/clustering/canopy/canopy.dat";
        LinkedList<LinkedList<String>> records =new LinkedList<LinkedList<String>>();
        //数据文件位置，txt，用; 分隔
        String filePath="";
        BufferedReader br = new BufferedReader(new InputStreamReader(
                new FileInputStream(filePath)));
        for (String line = br.readLine(); line != null; line = br.readLine()) {
            if(line.length()==0||"".equals(line))continue;
            String[] str=line.split(";");
            LinkedList<String> litm=new LinkedList<String>();
            for(int i=0;i<str.length;i++){
                litm.add(str[i].trim());
            }
            records.add(litm);
        }
        br.close();
        return records;
    }

    //读取每个单项出现次数
    public void count () {
//        LinkedList<LinkedList<String>> records;
        try {
//            records = readF1();
            for (LinkedList<String> l : this.totalRecords) {
                for(String s : l)
                {
                    if (oneCount.keySet().contains(s+";")) {
                        oneCount.put(s+";", oneCount.get(s+";") + 1);
                    }else {
                        oneCount.put(s+";", 1);
                    }
                }

            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //创建表头链
    /**
     *
     * @param records   原始记录List
     * @return
     */
    public LinkedList<FPTreeNode> buildHeaderLink(LinkedList<LinkedList<String>> records){
        LinkedList<FPTreeNode> header=null;
        if(records.size()>0){
            header=new LinkedList<FPTreeNode>();
        }else{
            return null;
        }
        Map<String, FPTreeNode> map = new HashMap<String, FPTreeNode>();
        for(LinkedList<String> items:records){

            for(String item:items){
                //如果存在数量增1，不存在则新增
                if(map.containsKey(item)){
                    map.get(item).Sum(1);
                }else{
                    FPTreeNode node=new FPTreeNode();
                    node.setName(item);
                    node.setCount(1);
                    map.put(item, node);
                }
            }
        }
        // 把支持度大于（或等于）minSup的项加入到F1中
        Set<String> names = map.keySet();
        for (String name : names) {
            FPTreeNode tnode = map.get(name);
            if (tnode.getCount() >= support) {
                header.add(tnode);
            }
        }
        sort(header);

        String test="ddd";
        return header;
    }

    //选择法排序,如果次数相等，则按名字排序,字典顺序,先小写后大写
    public List<FPTreeNode> sort(List<FPTreeNode> list){
        int len=list.size();
        for(int i=0;i<len;i++){
            for(int j=i+1;j<len;j++){
                FPTreeNode node1=list.get(i);
                FPTreeNode node2=list.get(j);
                if(node1.getCount()<node2.getCount()){
                    FPTreeNode tmp=new FPTreeNode();
                    tmp=node2;
                    list.remove(j);
                    //list指定位置插入，原来的>=j元素都会往下移，不会删除,所以插入前要删除掉原来的元素
                    list.add(j,node1);
                    list.remove(i);
                    list.add(i,tmp);
                }
                //如果次数相等，则按名字排序,字典顺序,先小写后大写
                if(node1.getCount()==node2.getCount()){
                    String name1=node1.getName();
                    String name2=node2.getName();
                    int flag=name1.compareTo(name2);
                    if(flag>0){
                        FPTreeNode tmp=new FPTreeNode();
                        tmp=node2;
                        list.remove(j);
                        //list指定位置插入，原来的>=j元素都会往下移，不会删除,所以插入前要删除掉原来的元素
                        list.add(j,node1);
                        list.remove(i);
                        list.add(i,tmp);
                    }


                }
            }
        }

        return list;
    }

    //选择法排序，降序,如果同名按L 中的次序排序
    public   List<String> itemsort(LinkedList<String> lis,List<FPTreeNode> header){
        //List<String> list=new ArrayList<String>();
        //选择法排序
        int len=lis.size();
        for(int i=0;i<len;i++){
            for(int j=i+1;j<len;j++){
                String key1=lis.get(i);
                String key2=lis.get(j);
                Integer value1=findcountByname(key1,header);
                if(value1==-1)continue;
                Integer value2=findcountByname(key2,header);
                if(value2==-1)continue;
                if(value1<value2){
                    String tmp=key2;
                    lis.remove(j);
                    lis.add(j,key1);
                    lis.remove(i);
                    lis.add(i,tmp);
                }
                if(value1==value2){
                    int v1=ordermap.get(key1);
                    int v2=ordermap.get(key2);
                    if(v1>v2){
                        String tmp=key2;
                        lis.remove(j);
                        lis.add(j,key1);
                        lis.remove(i);
                        lis.add(i,tmp);
                    }
                }
            }
        }
        return lis;
    }

    public Integer findcountByname(String itemname,List<FPTreeNode> header){
        Integer count=-1;
        for(FPTreeNode node:header){
            if(node.getName().equals(itemname)){
                count= node.getCount();
            }
        }
        return count;
    }

    /**
     *
     * @param records 构建树的记录,如I1,I2,I3
     * @param header 韩书中介绍的表头
     * @return 返回构建好的树
     */

    public FPTreeNode builderFpTree(LinkedList<LinkedList<String>> records,List<FPTreeNode> header){
        FPTreeNode root;
        if(records.size()<=0){
            return null;
        }
        root=new FPTreeNode();
        for(LinkedList<String> items:records){
            itemsort(items,header);
            addNode(root,items,header);
        }
        String dd="dd";
        String test=dd;
        return root;
    }
    //当已经有分枝存在的时候，判断新来的节点是否属于该分枝的某个节点，或全部重合，递归
    public  FPTreeNode addNode(FPTreeNode root,LinkedList<String> items,List<FPTreeNode> header){
        if(items.size()<=0)return null;
        String item=items.poll();
        //当前节点的孩子节点不包含该节点，那么另外创建一支分支。
        FPTreeNode node=root.findChild(item);
        if(node==null){
            node=new FPTreeNode();
            node.setName(item);
            node.setCount(1);
            node.setParent(root);
            root.addChild(node);

            //加将各个节点加到链头中
            for(FPTreeNode head:header){
                if(head.getName().equals(item)){
                    while(head.getNextHomonym()!=null){
                        head=head.getNextHomonym();
                    }
                    head.setNextHomonym(node);
                    break;
                }
            }
            //加将各个节点加到链头中
        }else{
            node.setCount(node.getCount()+1);
        }

        addNode(node,items,header);
        return root;
    }
    //从叶子找到根节点，递归之
    public void toroot(FPTreeNode node,LinkedList<String> newrecord){
        if(node.getParent()==null)return;
        String name=node.getName();
        newrecord.add(name);
        toroot(node.getParent(),newrecord);
    }
    //对条件FP-tree树进行组合，以求出频繁项集
    public void combineItem(FPTreeNode node,LinkedList<String> newrecord,String Item){
        if(node.getParent()==null)return;
        String name=node.getName();
        newrecord.add(name);
        toroot(node.getParent(),newrecord);
    }
    //fp-growth

    public void fpgrowth(LinkedList<LinkedList<String>> records,String item){
        //保存新的条件模式基的各个记录，以重新构造FP-tree
        LinkedList<LinkedList<String>> newrecords=new LinkedList<LinkedList<String>>();
        //构建链头
        LinkedList<FPTreeNode> header=buildHeaderLink(records);
        //创建FP-Tree
        FPTreeNode fptree= builderFpTree(records,header);
        //结束递归的条件
        if(header.size()<=0||fptree==null){
            return;
        }
        //打印结果,输出频繁项集
        if(item!=null){
            //寻找条件模式基,从链尾开始
            for(int i=header.size()-1;i>=0;i--){
                FPTreeNode head=header.get(i);
                String itemname=head.getName();
                Integer count=0;
                while(head.getNextHomonym()!=null){
                    head=head.getNextHomonym();
                    //叶子count等于多少，就算多少条记录
                    count=count+head.getCount();

                }
                //打印频繁项集
                String items = "";
                items = item+";"+head.getName()+";";
                if (items.split(";").length<3) {
                    frequentCollectionMap.put(items, count);
                }

//                System.out.println(item+";"+head.getName()+"="+count);
//                builder.append(item+";"+head.getName()+"="+count+"\n");
            }
        }
        //寻找条件模式基,从链尾开始
        for(int i=header.size()-1;i>=0;i--){
            FPTreeNode head=header.get(i);
            String itemname;
            //再组合
            if(item==null){
                itemname=head.getName();
            }else{
                itemname=head.getName()+";"+item;
            }

            while(head.getNextHomonym()!=null){
                head=head.getNextHomonym();
                //叶子count等于多少，就算多少条记录
                Integer count=head.getCount();
                for(int n=0;n<count;n++){
                    LinkedList<String> record=new LinkedList<String>();
                    toroot(head.getParent(),record);
                    newrecords.add(record);
                }
            }
            //递归之,以求子FP-Tree
            fpgrowth(newrecords,itemname);
        }
    }
    //保存次序，此步也可以省略，为了减少再加工结果的麻烦而加
    public void orderF1(LinkedList<FPTreeNode> orderheader){
        for(int i=0;i<orderheader.size();i++){
            FPTreeNode node=orderheader.get(i);
            ordermap.put(node.getName(), i);
        }

    }

    public void getRelationRules(Map<String, Integer> frequentCollectionMap) {
//        count();
        Map<String, Double> relationRules = new HashMap<String, Double>();
        Set<String> keySet = frequentCollectionMap.keySet();
        for (String key : keySet) {
            double countAll = frequentCollectionMap.get(key);
            String[] keyItems = key.split(ITEM_SPLIT);
            if (keyItems.length > 1) {
                List<String> source = new ArrayList<String>();
                Collections.addAll(source, keyItems);
                List<List<String>> result = new ArrayList<List<String>>();
                buildSubSet(source, result);// 获得source的所有非空子集
//              System.out.println("----------\n"+source.toString()+"\n"+result.toString()+"\n-----------------\n");
                for (List<String> resultItemList : result) {
                    if (resultItemList.size() < source.size()) {// 只处理真子集
                        List<String> otherList = new ArrayList<String>();
                        for (String sourceItem : source) {
                            if (!resultItemList.contains(sourceItem)) {
                                otherList.add(sourceItem);
                            }
                        }
                        String reasonStr = "";// 前置
                        String resultStr = "";// 结果
                        for (String item : resultItemList) {
                            reasonStr = reasonStr + item + ITEM_SPLIT;
                        }
                        for (String item : otherList) {
                            resultStr = resultStr + item + ITEM_SPLIT;
                        }

                        double countReason = oneCount.get(reasonStr);
                        double itemConfidence = countAll / countReason;// 计算置信度
                        if (itemConfidence >= CONFIDENCE) {
//                          String rule = reasonStr + "->" + resultStr;
                            Map rule = new HashMap<String,String>();
                            rule.put(reasonStr, resultStr);
                            rules.put(rule, itemConfidence);
                        }
                    }
                }
            }
        }
    }

    private void buildSubSet(List<String> sourceSet, List<List<String>> result) {
        // 仅有一个元素时，递归终止。此时非空子集仅为其自身，所以直接添加到result中
        if (sourceSet.size() == 1) {
            List<String> set = new ArrayList<String>();
            set.add(sourceSet.get(0));
            result.add(set);
        } else if (sourceSet.size() > 1) {
            // 当有n个元素时，递归求出前n-1个子集，在于result中
            buildSubSet(sourceSet.subList(0, sourceSet.size() - 1), result);
            int size = result.size();// 求出此时result的长度，用于后面的追加第n个元素时计数
            // 把第n个元素加入到集合中
            List<String> single = new ArrayList<String>();
            single.add(sourceSet.get(sourceSet.size() - 1));
            result.add(single);
            // 在保留前面的n-1子集的情况下，把第n个元素分别加到前n个子集中，并把新的集加入到result中;
            // 为保留原有n-1的子集，所以需要先对其进行复制
            List<String> clone;
            for (int i = 0; i < size; i++) {
                clone = new ArrayList<String>();
                for (String str : result.get(i)) {
                    clone.add(str);
                }
                clone.add(sourceSet.get(sourceSet.size() - 1));

                result.add(clone);
            }
        }
    }


    public static void main(String[] args) throws IOException {
        // TODO Auto-generated method stub
        /*String s1="i1";
        int flag=s1.compareTo("I1");
        System.out.println(flag);*/
        //读取数据
//        ShopFPGrowth fpg=new ShopFPGrowth();
//        LinkedList<LinkedList<String>> records=fpg.readF1();
//        LinkedList<FPTreeNode> orderheader=fpg.buildHeaderLink(records);
//        fpg.orderF1(orderheader);
//        fpg.fpgrowth(records,null);
//        fpg.getRelationRules(fpg.frequentCollectionMap);
////                System.out.println(fpg.frequentCollectionMap);
//        System.out.println(fpg.rules);
    }



}
