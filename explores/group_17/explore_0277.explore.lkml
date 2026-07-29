# Explore: explore_0277
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00832.view.lkml"
include: "/views/domain_34/view_00834.view.lkml"
include: "/views/domain_35/view_00835.view.lkml"
include: "/views/domain_36/view_00836.view.lkml"

explore: explore_0277 {
  label: "Explore Explore 0277"
  description: "Comprehensive analytics explore joining base view_00832 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00832
  
  always_filter: {
    filters: [view_00832.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00832.created_at_date: "7 days"]
    unless: [view_00832.id, view_00832.status]
  }

  join: view_00834 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00832.user_id} = ${view_00834.id} ;;
    required_joins: []
  }

  join: view_00835 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00832.account_id} = ${view_00835.account_id} ;;
    required_joins: [view_00834]
  }

  join: view_00836 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00832.category} = ${view_00836.category} ;;
  }

  access_filter: {
    field: view_00832.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00832.is_deleted} = false ;;
}
