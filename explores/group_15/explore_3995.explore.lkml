# Explore: explore_3995
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11986.view.lkml"
include: "/views/domain_38/view_11988.view.lkml"
include: "/views/domain_39/view_11989.view.lkml"
include: "/views/domain_40/view_11990.view.lkml"

explore: explore_3995 {
  label: "Explore Explore 3995"
  description: "Comprehensive analytics explore joining base view_11986 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11986
  
  always_filter: {
    filters: [view_11986.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11986.created_at_date: "7 days"]
    unless: [view_11986.id, view_11986.status]
  }

  join: view_11988 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11986.user_id} = ${view_11988.id} ;;
    required_joins: []
  }

  join: view_11989 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11986.account_id} = ${view_11989.account_id} ;;
    required_joins: [view_11988]
  }

  join: view_11990 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11986.category} = ${view_11990.category} ;;
  }

  access_filter: {
    field: view_11986.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11986.is_deleted} = false ;;
}
