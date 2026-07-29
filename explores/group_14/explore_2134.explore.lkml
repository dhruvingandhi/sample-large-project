# Explore: explore_2134
# Auto-generated LookML Explore File

include: "/views/domain_03/view_06403.view.lkml"
include: "/views/domain_05/view_06405.view.lkml"
include: "/views/domain_06/view_06406.view.lkml"
include: "/views/domain_07/view_06407.view.lkml"

explore: explore_2134 {
  label: "Explore Explore 2134"
  description: "Comprehensive analytics explore joining base view_06403 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06403
  
  always_filter: {
    filters: [view_06403.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06403.created_at_date: "7 days"]
    unless: [view_06403.id, view_06403.status]
  }

  join: view_06405 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06403.user_id} = ${view_06405.id} ;;
    required_joins: []
  }

  join: view_06406 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06403.account_id} = ${view_06406.account_id} ;;
    required_joins: [view_06405]
  }

  join: view_06407 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06403.category} = ${view_06407.category} ;;
  }

  access_filter: {
    field: view_06403.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06403.is_deleted} = false ;;
}
