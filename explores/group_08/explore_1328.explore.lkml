# Explore: explore_1328
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03985.view.lkml"
include: "/views/domain_37/view_03987.view.lkml"
include: "/views/domain_38/view_03988.view.lkml"
include: "/views/domain_39/view_03989.view.lkml"

explore: explore_1328 {
  label: "Explore Explore 1328"
  description: "Comprehensive analytics explore joining base view_03985 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03985
  
  always_filter: {
    filters: [view_03985.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03985.created_at_date: "7 days"]
    unless: [view_03985.id, view_03985.status]
  }

  join: view_03987 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03985.user_id} = ${view_03987.id} ;;
    required_joins: []
  }

  join: view_03988 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03985.account_id} = ${view_03988.account_id} ;;
    required_joins: [view_03987]
  }

  join: view_03989 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03985.category} = ${view_03989.category} ;;
  }

  access_filter: {
    field: view_03985.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03985.is_deleted} = false ;;
}
