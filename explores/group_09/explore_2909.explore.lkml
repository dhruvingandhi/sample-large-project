# Explore: explore_2909
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08728.view.lkml"
include: "/views/domain_30/view_08730.view.lkml"
include: "/views/domain_31/view_08731.view.lkml"
include: "/views/domain_32/view_08732.view.lkml"

explore: explore_2909 {
  label: "Explore Explore 2909"
  description: "Comprehensive analytics explore joining base view_08728 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08728
  
  always_filter: {
    filters: [view_08728.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08728.created_at_date: "7 days"]
    unless: [view_08728.id, view_08728.status]
  }

  join: view_08730 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08728.user_id} = ${view_08730.id} ;;
    required_joins: []
  }

  join: view_08731 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08728.account_id} = ${view_08731.account_id} ;;
    required_joins: [view_08730]
  }

  join: view_08732 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08728.category} = ${view_08732.category} ;;
  }

  access_filter: {
    field: view_08728.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08728.is_deleted} = false ;;
}
