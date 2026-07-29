# Explore: explore_2328
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06985.view.lkml"
include: "/views/domain_37/view_06987.view.lkml"
include: "/views/domain_38/view_06988.view.lkml"
include: "/views/domain_39/view_06989.view.lkml"

explore: explore_2328 {
  label: "Explore Explore 2328"
  description: "Comprehensive analytics explore joining base view_06985 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06985
  
  always_filter: {
    filters: [view_06985.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06985.created_at_date: "7 days"]
    unless: [view_06985.id, view_06985.status]
  }

  join: view_06987 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06985.user_id} = ${view_06987.id} ;;
    required_joins: []
  }

  join: view_06988 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06985.account_id} = ${view_06988.account_id} ;;
    required_joins: [view_06987]
  }

  join: view_06989 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06985.category} = ${view_06989.category} ;;
  }

  access_filter: {
    field: view_06985.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06985.is_deleted} = false ;;
}
