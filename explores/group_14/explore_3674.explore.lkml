# Explore: explore_3674
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11023.view.lkml"
include: "/views/domain_25/view_11025.view.lkml"
include: "/views/domain_26/view_11026.view.lkml"
include: "/views/domain_27/view_11027.view.lkml"

explore: explore_3674 {
  label: "Explore Explore 3674"
  description: "Comprehensive analytics explore joining base view_11023 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11023
  
  always_filter: {
    filters: [view_11023.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11023.created_at_date: "7 days"]
    unless: [view_11023.id, view_11023.status]
  }

  join: view_11025 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11023.user_id} = ${view_11025.id} ;;
    required_joins: []
  }

  join: view_11026 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11023.account_id} = ${view_11026.account_id} ;;
    required_joins: [view_11025]
  }

  join: view_11027 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11023.category} = ${view_11027.category} ;;
  }

  access_filter: {
    field: view_11023.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11023.is_deleted} = false ;;
}
