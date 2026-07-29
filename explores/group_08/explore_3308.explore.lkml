# Explore: explore_3308
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09925.view.lkml"
include: "/views/domain_27/view_09927.view.lkml"
include: "/views/domain_28/view_09928.view.lkml"
include: "/views/domain_29/view_09929.view.lkml"

explore: explore_3308 {
  label: "Explore Explore 3308"
  description: "Comprehensive analytics explore joining base view_09925 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09925
  
  always_filter: {
    filters: [view_09925.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09925.created_at_date: "7 days"]
    unless: [view_09925.id, view_09925.status]
  }

  join: view_09927 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09925.user_id} = ${view_09927.id} ;;
    required_joins: []
  }

  join: view_09928 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09925.account_id} = ${view_09928.account_id} ;;
    required_joins: [view_09927]
  }

  join: view_09929 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09925.category} = ${view_09929.category} ;;
  }

  access_filter: {
    field: view_09925.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09925.is_deleted} = false ;;
}
