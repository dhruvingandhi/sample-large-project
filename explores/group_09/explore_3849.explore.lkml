# Explore: explore_3849
# Auto-generated LookML Explore File

include: "/views/domain_48/view_11548.view.lkml"
include: "/views/domain_50/view_11550.view.lkml"
include: "/views/domain_01/view_11551.view.lkml"
include: "/views/domain_02/view_11552.view.lkml"

explore: explore_3849 {
  label: "Explore Explore 3849"
  description: "Comprehensive analytics explore joining base view_11548 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11548
  
  always_filter: {
    filters: [view_11548.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11548.created_at_date: "7 days"]
    unless: [view_11548.id, view_11548.status]
  }

  join: view_11550 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11548.user_id} = ${view_11550.id} ;;
    required_joins: []
  }

  join: view_11551 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11548.account_id} = ${view_11551.account_id} ;;
    required_joins: [view_11550]
  }

  join: view_11552 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11548.category} = ${view_11552.category} ;;
  }

  access_filter: {
    field: view_11548.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11548.is_deleted} = false ;;
}
