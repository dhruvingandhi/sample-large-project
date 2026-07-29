# Explore: explore_3999
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11998.view.lkml"
include: "/views/domain_50/view_12000.view.lkml"
include: "/views/domain_01/view_12001.view.lkml"
include: "/views/domain_02/view_12002.view.lkml"

explore: explore_3999 {
  label: "Explore Explore 3999"
  description: "Comprehensive analytics explore joining base view_11998 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11998
  
  always_filter: {
    filters: [view_11998.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11998.created_at_date: "7 days"]
    unless: [view_11998.id, view_11998.status]
  }

  join: view_12000 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11998.user_id} = ${view_12000.id} ;;
    required_joins: []
  }

  join: view_12001 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11998.account_id} = ${view_12001.account_id} ;;
    required_joins: [view_12000]
  }

  join: view_12002 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11998.category} = ${view_12002.category} ;;
  }

  access_filter: {
    field: view_11998.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11998.is_deleted} = false ;;
}
