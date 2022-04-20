import raftos
import asyncio

PORT = 8000
NODE_ID = 1
TASK_NO = 3
other_nodes = [i for i in [8000, 8001, 8002] if i != PORT]


raftos.configure({
        'log_path': './',
        'serializer': raftos.serializers.JSONSerializer
})

loop = asyncio.get_event_loop()


loop.create_task(
    raftos.register(
        # node running on this machine
        f'127.0.0.1:{PORT}',

        # other servers
        cluster=[
            f'127.0.0.1:{other_nodes[0]}',
            f'127.0.0.1:{other_nodes[1]}'
        ]
    )
)


with open(f'task{TASK_NO}_node{NODE_ID}.txt', 'w') as f:
    pass


async def run(loop):
    data_id = raftos.Replicated(name='data_id')

    while raftos.get_leader() != f'127.0.0.1:{PORT}':
        await asyncio.sleep(5)

        with open(f'task{TASK_NO}_node{NODE_ID}.txt', 'a') as f:
            leader = raftos.get_leader()
            f.write(f'LEADER => {leader}\n')

    await asyncio.sleep(5)

    with open(f'task{TASK_NO}_node{NODE_ID}.txt', 'a') as f:
        f.write(f'LEADER -> {NODE_ID}\n')
        await data_id.set(NODE_ID)
        f.write('done writing data_id\n')

    with open(f'task{TASK_NO}_node{NODE_ID}.txt', 'a') as f:
        f.write('done writing data\n')
        await asyncio.sleep(2)
    print('done')

loop.run_until_complete(run(loop))
