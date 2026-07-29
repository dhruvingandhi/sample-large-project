# Explore: explore_3729
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11188.view.lkml"
include: "/views/domain_40/view_11190.view.lkml"
include: "/views/domain_41/view_11191.view.lkml"
include: "/views/domain_42/view_11192.view.lkml"

explore: explore_3729 {
  label: "Explore Explore 3729"
  description: "Comprehensive analytics explore joining base view_11188 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11188
  
  always_filter: {
    filters: [view_11188.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11188.created_at_date: "7 days"]
    unless: [view_11188.id, view_11188.status]
  }

  join: view_11190 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11188.user_id} = ${view_11190.id} ;;
    required_joins: []
  }

  join: view_11191 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11188.account_id} = ${view_11191.account_id} ;;
    required_joins: [view_11190]
  }

  join: view_11192 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11188.category} = ${view_11192.category} ;;
  }

  access_filter: {
    field: view_11188.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11188.is_deleted} = false ;;
}
