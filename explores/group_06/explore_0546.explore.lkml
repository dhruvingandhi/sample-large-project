# Explore: explore_0546
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01639.view.lkml"
include: "/views/domain_41/view_01641.view.lkml"
include: "/views/domain_42/view_01642.view.lkml"
include: "/views/domain_43/view_01643.view.lkml"

explore: explore_0546 {
  label: "Explore Explore 0546"
  description: "Comprehensive analytics explore joining base view_01639 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01639
  
  always_filter: {
    filters: [view_01639.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01639.created_at_date: "7 days"]
    unless: [view_01639.id, view_01639.status]
  }

  join: view_01641 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01639.user_id} = ${view_01641.id} ;;
    required_joins: []
  }

  join: view_01642 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01639.account_id} = ${view_01642.account_id} ;;
    required_joins: [view_01641]
  }

  join: view_01643 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01639.category} = ${view_01643.category} ;;
  }

  access_filter: {
    field: view_01639.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01639.is_deleted} = false ;;
}
