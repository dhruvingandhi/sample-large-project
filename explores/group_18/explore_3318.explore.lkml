# Update for 2000 file diff target
# Explore: explore_3318
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09955.view.lkml"
include: "/views/domain_07/view_09957.view.lkml"
include: "/views/domain_08/view_09958.view.lkml"
include: "/views/domain_09/view_09959.view.lkml"

explore: explore_3318 {
  label: "Explore Explore 3318"
  description: "Comprehensive analytics explore joining base view_09955 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09955
  
  always_filter: {
    filters: [view_09955.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09955.created_at_date: "7 days"]
    unless: [view_09955.id, view_09955.status]
  }

  join: view_09957 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09955.user_id} = ${view_09957.id} ;;
    required_joins: []
  }

  join: view_09958 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09955.account_id} = ${view_09958.account_id} ;;
    required_joins: [view_09957]
  }

  join: view_09959 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09955.category} = ${view_09959.category} ;;
  }

  access_filter: {
    field: view_09955.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09955.is_deleted} = false ;;
}
