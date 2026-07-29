# Explore: explore_3546
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10639.view.lkml"
include: "/views/domain_41/view_10641.view.lkml"
include: "/views/domain_42/view_10642.view.lkml"
include: "/views/domain_43/view_10643.view.lkml"

explore: explore_3546 {
  label: "Explore Explore 3546"
  description: "Comprehensive analytics explore joining base view_10639 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10639
  
  always_filter: {
    filters: [view_10639.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10639.created_at_date: "7 days"]
    unless: [view_10639.id, view_10639.status]
  }

  join: view_10641 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10639.user_id} = ${view_10641.id} ;;
    required_joins: []
  }

  join: view_10642 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10639.account_id} = ${view_10642.account_id} ;;
    required_joins: [view_10641]
  }

  join: view_10643 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10639.category} = ${view_10643.category} ;;
  }

  access_filter: {
    field: view_10639.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10639.is_deleted} = false ;;
}
