# Explore: explore_2999
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08998.view.lkml"
include: "/views/domain_50/view_09000.view.lkml"
include: "/views/domain_01/view_09001.view.lkml"
include: "/views/domain_02/view_09002.view.lkml"

explore: explore_2999 {
  label: "Explore Explore 2999"
  description: "Comprehensive analytics explore joining base view_08998 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08998
  
  always_filter: {
    filters: [view_08998.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08998.created_at_date: "7 days"]
    unless: [view_08998.id, view_08998.status]
  }

  join: view_09000 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08998.user_id} = ${view_09000.id} ;;
    required_joins: []
  }

  join: view_09001 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08998.account_id} = ${view_09001.account_id} ;;
    required_joins: [view_09000]
  }

  join: view_09002 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08998.category} = ${view_09002.category} ;;
  }

  access_filter: {
    field: view_08998.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08998.is_deleted} = false ;;
}
