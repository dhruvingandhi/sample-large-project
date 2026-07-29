# Explore: explore_2604
# Auto-generated LookML Explore File

include: "/views/domain_13/view_07813.view.lkml"
include: "/views/domain_15/view_07815.view.lkml"
include: "/views/domain_16/view_07816.view.lkml"
include: "/views/domain_17/view_07817.view.lkml"

explore: explore_2604 {
  label: "Explore Explore 2604"
  description: "Comprehensive analytics explore joining base view_07813 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07813
  
  always_filter: {
    filters: [view_07813.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07813.created_at_date: "7 days"]
    unless: [view_07813.id, view_07813.status]
  }

  join: view_07815 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07813.user_id} = ${view_07815.id} ;;
    required_joins: []
  }

  join: view_07816 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07813.account_id} = ${view_07816.account_id} ;;
    required_joins: [view_07815]
  }

  join: view_07817 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07813.category} = ${view_07817.category} ;;
  }

  access_filter: {
    field: view_07813.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07813.is_deleted} = false ;;
}
