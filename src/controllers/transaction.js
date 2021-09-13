const redis = require('redis');
const _ = require('lodash');
const transactionModel = require('../models/transaction_model');
const { success, failed } = require('../helpers/response');

const client = redis.createClient();
const redisAction = require('../helpers/redis');

const transaction = {
  // getList: (req, res) => {
  //   try {
  //     const { query } = req;
  //     const search = query.search === undefined ? '' : query.search;
  //     const field = query.field === undefined ? 'transaction_id' : query.field;
  //     const typeSort = query.sort === undefined ? 'ASC' : query.sort;
  //     const limit = query.limit === undefined ? '5' : query.limit;
  //     const offset = query.page === undefined || query.page === 1 ? 0 : (query.page - 1) * limit;
  //     client.get('transaction', (err, resultRedis) => {
  //       if (!resultRedis) {
  //         transactionModel
  //           .getList(search, field, typeSort, limit, offset)
  //           // .getList(field, typeSort, limit, offset)
  //           .then(async (result) => {
  //             const allData = await transactionModel.getAll();
  //             redisAction.set('transaction', JSON.stringify(allData));
  //             const response = {
  //               data: result,
  //               totalPage: Math.ceil(allData.length / limit),
  //               search,
  //               limit,
  //               page: req.query.page,
  //             };
  //             success(res, response, 200, 'Get all transaction success');
  //           });
  //       } else {
  //         const dataRes = JSON.parse(resultRedis);
  //         const sort = _.sortBy(dataRes, typeSort);
  //         const pagination = _.slice(sort, offset, offset + limit);
  //         const response = {
  //           data: pagination,
  //           totalPage: Math.ceil(dataRes.length / limit),
  //           search,
  //           limit,
  //           page: req.query.page,
  //         };
  //         success(res, response, 200, 'Get all Transaction success');
  //       }
  //     });
  //   } catch (err) {
  //     failed(res, 404, err);
  //   }
  // },
  getDetail: (req, res) => {
    try {
      const { id } = req.params;
      client.get('transaction', (err, resultRedis) => {
        if (!resultRedis) {
          transactionModel
            .getDetails(id)
            .then(async (result) => {
              const allData = await transactionModel.getAll();
              redisAction.set('transaction', JSON.stringify(allData));
              success(res, result, 200, 'Get details Transaction success');
            })
            .catch((error) => {
              failed(res, 404, error);
            });
        } else {
          const dataRes = JSON.parse(resultRedis);
          // eslint-disable-next-line eqeqeq
          const filterData = _.filter(dataRes, (e) => (e.user_id == id ? e : undefined));
          success(res, filterData, 200, 'Get Details Transaction Succes');
        }
      });
    } catch (err) {
      failed(res, 404, err);
    }
  },
  insert: (req, res) => {
    try {
      const { body } = req;

      transactionModel
        .insert(body)
        .then((result) => {
          client.del('transaction');
          success(res, result, 200, 'Insert data Transaction success');
        })
        .catch((err) => {
          failed(res, 400, err);
        });
    } catch (err) {
      failed(res, 400, err);
    }
  },
  update: (req, res) => {
    try {
      const { id } = req.params;
      const { body } = req;
      transactionModel
        .update(id, body)
        .then((result) => {
          client.del('transaction');
          success(res, result, 200, 'Update data Transaction success');
        })
        .catch((err) => {
          failed(res, 400, err);
        });
    } catch (err) {
      failed(res, 400, err);
    }
  },
  destroy: (req, res) => {
    try {
      const { id } = req.params;
      transactionModel
        .destroy(id)
        .then((result) => {
          client.del('transaction');
          success(res, result, 200, 'Delete data Transaction success');
        })
        .catch((err) => {
          failed(res, 404, err);
        });
    } catch (err) {
      failed(res, 404, err);
    }
  },
};

module.exports = transaction;
