# Explore: explore_2546
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07639.view.lkml"
include: "/views/domain_41/view_07641.view.lkml"
include: "/views/domain_42/view_07642.view.lkml"
include: "/views/domain_43/view_07643.view.lkml"

explore: explore_2546 {
  label: "Explore Explore 2546"
  description: "Comprehensive analytics explore joining base view_07639 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07639
  
  always_filter: {
    filters: [view_07639.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07639.created_at_date: "7 days"]
    unless: [view_07639.id, view_07639.status]
  }

  join: view_07641 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07639.user_id} = ${view_07641.id} ;;
    required_joins: []
  }

  join: view_07642 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07639.account_id} = ${view_07642.account_id} ;;
    required_joins: [view_07641]
  }

  join: view_07643 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07639.category} = ${view_07643.category} ;;
  }

  access_filter: {
    field: view_07639.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07639.is_deleted} = false ;;
}
