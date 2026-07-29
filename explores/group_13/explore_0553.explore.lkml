# Explore: explore_0553
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01660.view.lkml"
include: "/views/domain_12/view_01662.view.lkml"
include: "/views/domain_13/view_01663.view.lkml"
include: "/views/domain_14/view_01664.view.lkml"

explore: explore_0553 {
  label: "Explore Explore 0553"
  description: "Comprehensive analytics explore joining base view_01660 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01660
  
  always_filter: {
    filters: [view_01660.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01660.created_at_date: "7 days"]
    unless: [view_01660.id, view_01660.status]
  }

  join: view_01662 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01660.user_id} = ${view_01662.id} ;;
    required_joins: []
  }

  join: view_01663 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01660.account_id} = ${view_01663.account_id} ;;
    required_joins: [view_01662]
  }

  join: view_01664 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01660.category} = ${view_01664.category} ;;
  }

  access_filter: {
    field: view_01660.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01660.is_deleted} = false ;;
}
