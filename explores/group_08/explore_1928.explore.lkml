# Explore: explore_1928
# Auto-generated LookML Explore File

include: "/views/domain_35/view_05785.view.lkml"
include: "/views/domain_37/view_05787.view.lkml"
include: "/views/domain_38/view_05788.view.lkml"
include: "/views/domain_39/view_05789.view.lkml"

explore: explore_1928 {
  label: "Explore Explore 1928"
  description: "Comprehensive analytics explore joining base view_05785 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05785
  
  always_filter: {
    filters: [view_05785.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05785.created_at_date: "7 days"]
    unless: [view_05785.id, view_05785.status]
  }

  join: view_05787 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05785.user_id} = ${view_05787.id} ;;
    required_joins: []
  }

  join: view_05788 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05785.account_id} = ${view_05788.account_id} ;;
    required_joins: [view_05787]
  }

  join: view_05789 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05785.category} = ${view_05789.category} ;;
  }

  access_filter: {
    field: view_05785.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05785.is_deleted} = false ;;
}
