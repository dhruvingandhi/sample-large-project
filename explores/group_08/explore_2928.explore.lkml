# Explore: explore_2928
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08785.view.lkml"
include: "/views/domain_37/view_08787.view.lkml"
include: "/views/domain_38/view_08788.view.lkml"
include: "/views/domain_39/view_08789.view.lkml"

explore: explore_2928 {
  label: "Explore Explore 2928"
  description: "Comprehensive analytics explore joining base view_08785 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08785
  
  always_filter: {
    filters: [view_08785.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08785.created_at_date: "7 days"]
    unless: [view_08785.id, view_08785.status]
  }

  join: view_08787 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08785.user_id} = ${view_08787.id} ;;
    required_joins: []
  }

  join: view_08788 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08785.account_id} = ${view_08788.account_id} ;;
    required_joins: [view_08787]
  }

  join: view_08789 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08785.category} = ${view_08789.category} ;;
  }

  access_filter: {
    field: view_08785.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08785.is_deleted} = false ;;
}
