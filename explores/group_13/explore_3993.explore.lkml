# Explore: explore_3993
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11980.view.lkml"
include: "/views/domain_32/view_11982.view.lkml"
include: "/views/domain_33/view_11983.view.lkml"
include: "/views/domain_34/view_11984.view.lkml"

explore: explore_3993 {
  label: "Explore Explore 3993"
  description: "Comprehensive analytics explore joining base view_11980 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11980
  
  always_filter: {
    filters: [view_11980.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11980.created_at_date: "7 days"]
    unless: [view_11980.id, view_11980.status]
  }

  join: view_11982 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11980.user_id} = ${view_11982.id} ;;
    required_joins: []
  }

  join: view_11983 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11980.account_id} = ${view_11983.account_id} ;;
    required_joins: [view_11982]
  }

  join: view_11984 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11980.category} = ${view_11984.category} ;;
  }

  access_filter: {
    field: view_11980.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11980.is_deleted} = false ;;
}
