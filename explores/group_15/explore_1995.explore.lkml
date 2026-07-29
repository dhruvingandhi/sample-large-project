# Explore: explore_1995
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05986.view.lkml"
include: "/views/domain_38/view_05988.view.lkml"
include: "/views/domain_39/view_05989.view.lkml"
include: "/views/domain_40/view_05990.view.lkml"

explore: explore_1995 {
  label: "Explore Explore 1995"
  description: "Comprehensive analytics explore joining base view_05986 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05986
  
  always_filter: {
    filters: [view_05986.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05986.created_at_date: "7 days"]
    unless: [view_05986.id, view_05986.status]
  }

  join: view_05988 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05986.user_id} = ${view_05988.id} ;;
    required_joins: []
  }

  join: view_05989 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05986.account_id} = ${view_05989.account_id} ;;
    required_joins: [view_05988]
  }

  join: view_05990 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05986.category} = ${view_05990.category} ;;
  }

  access_filter: {
    field: view_05986.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05986.is_deleted} = false ;;
}
