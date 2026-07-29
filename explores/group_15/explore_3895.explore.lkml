# Explore: explore_3895
# Auto-generated LookML Explore File

include: "/views/domain_36/view_11686.view.lkml"
include: "/views/domain_38/view_11688.view.lkml"
include: "/views/domain_39/view_11689.view.lkml"
include: "/views/domain_40/view_11690.view.lkml"

explore: explore_3895 {
  label: "Explore Explore 3895"
  description: "Comprehensive analytics explore joining base view_11686 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11686
  
  always_filter: {
    filters: [view_11686.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11686.created_at_date: "7 days"]
    unless: [view_11686.id, view_11686.status]
  }

  join: view_11688 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11686.user_id} = ${view_11688.id} ;;
    required_joins: []
  }

  join: view_11689 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11686.account_id} = ${view_11689.account_id} ;;
    required_joins: [view_11688]
  }

  join: view_11690 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11686.category} = ${view_11690.category} ;;
  }

  access_filter: {
    field: view_11686.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11686.is_deleted} = false ;;
}
