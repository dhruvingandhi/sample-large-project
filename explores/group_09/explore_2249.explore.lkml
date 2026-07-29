# Explore: explore_2249
# Auto-generated LookML Explore File

include: "/views/domain_48/view_06748.view.lkml"
include: "/views/domain_50/view_06750.view.lkml"
include: "/views/domain_01/view_06751.view.lkml"
include: "/views/domain_02/view_06752.view.lkml"

explore: explore_2249 {
  label: "Explore Explore 2249"
  description: "Comprehensive analytics explore joining base view_06748 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06748
  
  always_filter: {
    filters: [view_06748.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06748.created_at_date: "7 days"]
    unless: [view_06748.id, view_06748.status]
  }

  join: view_06750 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06748.user_id} = ${view_06750.id} ;;
    required_joins: []
  }

  join: view_06751 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06748.account_id} = ${view_06751.account_id} ;;
    required_joins: [view_06750]
  }

  join: view_06752 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06748.category} = ${view_06752.category} ;;
  }

  access_filter: {
    field: view_06748.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06748.is_deleted} = false ;;
}
