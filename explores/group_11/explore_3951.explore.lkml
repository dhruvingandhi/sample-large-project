# Explore: explore_3951
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11854.view.lkml"
include: "/views/domain_06/view_11856.view.lkml"
include: "/views/domain_07/view_11857.view.lkml"
include: "/views/domain_08/view_11858.view.lkml"

explore: explore_3951 {
  label: "Explore Explore 3951"
  description: "Comprehensive analytics explore joining base view_11854 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11854
  
  always_filter: {
    filters: [view_11854.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11854.created_at_date: "7 days"]
    unless: [view_11854.id, view_11854.status]
  }

  join: view_11856 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11854.user_id} = ${view_11856.id} ;;
    required_joins: []
  }

  join: view_11857 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11854.account_id} = ${view_11857.account_id} ;;
    required_joins: [view_11856]
  }

  join: view_11858 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11854.category} = ${view_11858.category} ;;
  }

  access_filter: {
    field: view_11854.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11854.is_deleted} = false ;;
}
