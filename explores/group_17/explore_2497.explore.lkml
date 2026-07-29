# Explore: explore_2497
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07492.view.lkml"
include: "/views/domain_44/view_07494.view.lkml"
include: "/views/domain_45/view_07495.view.lkml"
include: "/views/domain_46/view_07496.view.lkml"

explore: explore_2497 {
  label: "Explore Explore 2497"
  description: "Comprehensive analytics explore joining base view_07492 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07492
  
  always_filter: {
    filters: [view_07492.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07492.created_at_date: "7 days"]
    unless: [view_07492.id, view_07492.status]
  }

  join: view_07494 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07492.user_id} = ${view_07494.id} ;;
    required_joins: []
  }

  join: view_07495 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07492.account_id} = ${view_07495.account_id} ;;
    required_joins: [view_07494]
  }

  join: view_07496 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07492.category} = ${view_07496.category} ;;
  }

  access_filter: {
    field: view_07492.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07492.is_deleted} = false ;;
}
