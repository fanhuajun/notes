1.ȥ�� distinct 
select distinct name from table1;

SQL���ִ��˳��
http://www.cnblogs.com/Qian123/p/5669259.html
1��FROM����FROM�Ӿ��е�ǰ������ִ�еѿ�������Cartesian product)(�������ӣ������������VT1

2��ON����VT1Ӧ��ONɸѡ����ֻ����Щʹ<join_condition>Ϊ����вű�����VT2��

3��OUTER(JOIN)���� ��ָ����OUTER JOIN�������CROSS JOIN ��(INNER JOIN),������preserved table�����ⲿ���Ӱ������Ϊ���������ⲿ���Ӱ��ұ���Ϊ��������ȫ�ⲿ���Ӱ����������Ϊ��������δ�ҵ�ƥ����н���Ϊ�ⲿ����ӵ� VT2,����VT3.���FROM�Ӿ�����������ϵı������һ���������ɵĽ�������һ�����ظ�ִ�в���1������3��ֱ�����������еı�Ϊֹ��

4��WHERE����VT3Ӧ��WHEREɸѡ����ֻ��ʹ<where_condition>Ϊtrue���вű�����VT4.

5��GROUP BY����GROUP BY�Ӿ��е����б��VT4�е��з��飬����VT5.

6��CUBE|ROLLUP���ѳ���(Suppergroups)����VT5,����VT6.

7��HAVING����VT6Ӧ��HAVINGɸѡ����ֻ��ʹ<having_condition>Ϊtrue����Żᱻ����VT7.

8��SELECT������SELECT�б�����VT8.

9��DISTINCT�����ظ����д�VT8���Ƴ�������VT9.

10��ORDER BY����VT9�е��а�ORDER BY �Ӿ��е����б����������α꣨VC10).

11��TOP����VC10�Ŀ�ʼ��ѡ��ָ��������������У����ɱ�VT11,�����ص����ߡ�1