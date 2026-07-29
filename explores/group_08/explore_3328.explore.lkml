# Explore: explore_3328
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09985.view.lkml"
include: "/views/domain_37/view_09987.view.lkml"
include: "/views/domain_38/view_09988.view.lkml"
include: "/views/domain_39/view_09989.view.lkml"

explore: explore_3328 {
  label: "Explore Explore 3328"
  description: "Comprehensive analytics explore joining base view_09985 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09985
  
  always_filter: {
    filters: [view_09985.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09985.created_at_date: "7 days"]
    unless: [view_09985.id, view_09985.status]
  }

  join: view_09987 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09985.user_id} = ${view_09987.id} ;;
    required_joins: []
  }

  join: view_09988 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09985.account_id} = ${view_09988.account_id} ;;
    required_joins: [view_09987]
  }

  join: view_09989 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09985.category} = ${view_09989.category} ;;
  }

  access_filter: {
    field: view_09985.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09985.is_deleted} = false ;;
}
