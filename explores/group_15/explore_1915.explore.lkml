# Explore: explore_1915
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05746.view.lkml"
include: "/views/domain_48/view_05748.view.lkml"
include: "/views/domain_49/view_05749.view.lkml"
include: "/views/domain_50/view_05750.view.lkml"

explore: explore_1915 {
  label: "Explore Explore 1915"
  description: "Comprehensive analytics explore joining base view_05746 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05746
  
  always_filter: {
    filters: [view_05746.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05746.created_at_date: "7 days"]
    unless: [view_05746.id, view_05746.status]
  }

  join: view_05748 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05746.user_id} = ${view_05748.id} ;;
    required_joins: []
  }

  join: view_05749 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05746.account_id} = ${view_05749.account_id} ;;
    required_joins: [view_05748]
  }

  join: view_05750 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05746.category} = ${view_05750.category} ;;
  }

  access_filter: {
    field: view_05746.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05746.is_deleted} = false ;;
}
