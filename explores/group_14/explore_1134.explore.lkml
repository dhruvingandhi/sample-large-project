# Explore: explore_1134
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03403.view.lkml"
include: "/views/domain_05/view_03405.view.lkml"
include: "/views/domain_06/view_03406.view.lkml"
include: "/views/domain_07/view_03407.view.lkml"

explore: explore_1134 {
  label: "Explore Explore 1134"
  description: "Comprehensive analytics explore joining base view_03403 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03403
  
  always_filter: {
    filters: [view_03403.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03403.created_at_date: "7 days"]
    unless: [view_03403.id, view_03403.status]
  }

  join: view_03405 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03403.user_id} = ${view_03405.id} ;;
    required_joins: []
  }

  join: view_03406 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03403.account_id} = ${view_03406.account_id} ;;
    required_joins: [view_03405]
  }

  join: view_03407 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03403.category} = ${view_03407.category} ;;
  }

  access_filter: {
    field: view_03403.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03403.is_deleted} = false ;;
}
