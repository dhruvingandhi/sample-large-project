# Explore: explore_3747
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11242.view.lkml"
include: "/views/domain_44/view_11244.view.lkml"
include: "/views/domain_45/view_11245.view.lkml"
include: "/views/domain_46/view_11246.view.lkml"

explore: explore_3747 {
  label: "Explore Explore 3747"
  description: "Comprehensive analytics explore joining base view_11242 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11242
  
  always_filter: {
    filters: [view_11242.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11242.created_at_date: "7 days"]
    unless: [view_11242.id, view_11242.status]
  }

  join: view_11244 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11242.user_id} = ${view_11244.id} ;;
    required_joins: []
  }

  join: view_11245 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11242.account_id} = ${view_11245.account_id} ;;
    required_joins: [view_11244]
  }

  join: view_11246 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11242.category} = ${view_11246.category} ;;
  }

  access_filter: {
    field: view_11242.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11242.is_deleted} = false ;;
}
