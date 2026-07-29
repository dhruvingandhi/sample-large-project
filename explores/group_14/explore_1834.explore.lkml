# Explore: explore_1834
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05503.view.lkml"
include: "/views/domain_05/view_05505.view.lkml"
include: "/views/domain_06/view_05506.view.lkml"
include: "/views/domain_07/view_05507.view.lkml"

explore: explore_1834 {
  label: "Explore Explore 1834"
  description: "Comprehensive analytics explore joining base view_05503 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05503
  
  always_filter: {
    filters: [view_05503.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05503.created_at_date: "7 days"]
    unless: [view_05503.id, view_05503.status]
  }

  join: view_05505 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05503.user_id} = ${view_05505.id} ;;
    required_joins: []
  }

  join: view_05506 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05503.account_id} = ${view_05506.account_id} ;;
    required_joins: [view_05505]
  }

  join: view_05507 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05503.category} = ${view_05507.category} ;;
  }

  access_filter: {
    field: view_05503.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05503.is_deleted} = false ;;
}
